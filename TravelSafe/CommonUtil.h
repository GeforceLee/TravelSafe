//
//  CommonUtil.h
//  TravelSafe
//
//  Created by LiYunlong on 16/6/12.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject
/**
 *  Bundlel Id
 *
 *  @return Bundlel Id
 */
+ (NSString *)appBundleId;

/**
 *  App 版本号
 *
 *  @return App 版本号
 */
+ (NSString *)appVersion;

/**
 *  App Build 版本号
 *
 *  @return  App Build 版本号
 */
+ (NSString *)appBuildVersion;

/**
 *  设备版本号 (iPhone 6,1)
 *
 *  @return 设备版本号
 */
+ (NSString *)deviceVersion;

/**
 *  设备名称 (iPhone 6s)
 *
 *  @return 设备名称
 */
+ (NSString *)deviceVersionName;
/**
 *  通过设备版本号获得设备名称
 *
 *  @param dv 设备版本号
 *
 *  @return 设备名称
 */
+ (NSString *)deviceVersionName:(NSString *)dv;

@end
