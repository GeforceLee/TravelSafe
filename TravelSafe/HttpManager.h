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
+ (HttpManager *)sharedHttpManager;

 
- (void)get:(NSString *)path withParam:(NSDictionary *)param andResult:(currencyResultBlock)result;

@end
