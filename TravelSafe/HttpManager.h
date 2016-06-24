//
//  HttpManager.h
//  TravelSafe
//
//  Created by LiYunlong on 16/6/12.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CommonDefine.h"
@interface HttpManager : AFHTTPSessionManager

/**
 *  获得单例的 HttpManager
 *
 *  @return HttpManager
 */
+ (HttpManager *)sharedHttpManager;


/**
 *  GET请求
 *
 *  @param path   路径
 *  @param param  参数
 *  @param result 处理返回结果的block
 */
- (void)get:(NSString *)path withParam:(NSDictionary *)param andResult:(handleResultBlock)result;

/**
 *  POST请求
 *
 *  @param path   路径
 *  @param param  参数
 *  @param result 处理返回结果的block
 */
- (void)post:(NSString *)path withParam:(NSDictionary *)param andResult:(handleResultBlock)result;
@end
