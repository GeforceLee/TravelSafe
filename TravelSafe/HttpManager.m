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

/**
 *  处理服务器返回结果
 *
 *  @param method 网络请求方法
 *  @param path   路径
 *  @param param  参数
 *  @param block  返回结果操作的block
 *  @param data   返回的数据
 *  @param error  返回的错误
 */
- (void)handleServerReturnMethod:(NSString *)method andPath:(NSString *)path andParam:(NSDictionary *)param andHandleResultBlock:(handleResultBlock)block andResultData:(id)data andError:(NSError *)error;

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



- (void)get:(NSString *)path withParam:(NSDictionary *)param andResult:(handleResultBlock)result{
    [_httpManager GET:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleServerReturnMethod:@"GET" andPath:path andParam:param andHandleResultBlock:result andResultData:responseObject andError:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleServerReturnMethod:@"GET" andPath:path andParam:param andHandleResultBlock:result andResultData:nil andError:error];
    }];
}
- (void)post:(NSString *)path withParam:(NSDictionary *)param andResult:(handleResultBlock)result{
    [_httpManager GET:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleServerReturnMethod:@"POST" andPath:path andParam:param andHandleResultBlock:result andResultData:responseObject andError:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleServerReturnMethod:@"POST" andPath:path andParam:param andHandleResultBlock:result andResultData:nil andError:error];
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


- (void)handleServerReturnMethod:(NSString *)method andPath:(NSString *)path andParam:(NSDictionary *)param andHandleResultBlock:(handleResultBlock)block andResultData:(id)data andError:(NSError *)error{
    DebugLog(@"网络请求方法:%@  |------|   路径:%@ \n 参数:%@",method,path,param);
    
    id resultData = nil;
    NSError *resultError = nil;
    if (error) {
            DebugLog(@"返回结果错误!---------!:%@",error);
        resultError = error;
    }else {
        NSDictionary *json = data;
        int code = [[json objectForKey:@"code"] intValue];
        
        if (code == 0) {
            resultData = [json objectForKey:@"data"];
        }else {
            resultError = [ErrorMaker createErrorWithCode:code withDesc:[json objectForKey:@"message"]];
        }
        DebugLog(@"返回结果:%@",json);
    }
    block(resultData,resultError);
}

@end
