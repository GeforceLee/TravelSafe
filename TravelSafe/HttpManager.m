//
//  HttpManager.m
//  TravelSafe
//
//  Created by LiYunlong on 16/6/12.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import "HttpManager.h"
#import "CommonUtil.h"
#import "UIDevice+FCUUID.h"
#import "ErrorMaker.h"

@interface HttpManager(Private)
/**
 *  创建User-Agent
 *
 *  @return User-Agent
 */
+ (NSString *)makeUserAgent;
@end
@implementation HttpManager
static HttpManager *_httpManager;
+ (HttpManager *)sharedHttpManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _httpManager = [[HttpManager alloc] initWithBaseURL:[NSURL URLWithString:ServerURL]];
        _httpManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        [_httpManager.requestSerializer setValue:[HttpManager makeUserAgent] forHTTPHeaderField:@"User-Agent"];
        DebugLog(@"%@",[HttpManager makeUserAgent]);
        [_httpManager.requestSerializer setValue:@"" forHTTPHeaderField:@"Authorization"];
    });
    return _httpManager;
}



- (void)get:(NSString *)path withParam:(NSDictionary *)param andResult:(currencyResultBlock)result{
    [_httpManager GET:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *json = responseObject;
        int code = [[json objectForKey:@"code"] intValue];
        if (code == 0) {
            result([json objectForKey:@"data"],nil);
        }else {
            NSError *error = [ErrorMaker createErrorWithCode:code withDesc:[json objectForKey:@"message"]];
            result(nil,error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}



#pragma  mark - 私有方法
+ (NSString *)makeUserAgent{
    //ezutrip.com/1.0.0/iOS/4.0/iPhone/UUID
    NSString * useragent = [NSString stringWithFormat:@"%@/%@_%@/iOS/%@/%@/%@",
                            [CommonUtil appBundleId],
                            [CommonUtil appVersion],
                            [CommonUtil appBuildVersion],
                            [UIDevice currentDevice].systemVersion,
                            [CommonUtil deviceVersionName],
                            [UIDevice currentDevice].uuid];
    
    return useragent;
}


@end
