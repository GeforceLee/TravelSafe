//
//  ErrorMaker.h
//  TravelSafe
//
//  Created by geforce on 16/6/3.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ErrorCodeKey @"ErrorCodeKey"
#define ErrorCodeDesc @"ErrorCodeDesc"
typedef NS_ENUM(NSUInteger,TSErrorType) {
    TSErrorTypeThird=0
};
@interface ErrorMaker : NSObject

/**
 *  创建一个Error
 *
 *  @param code 错误码
 *  @param desc 错误描述
 *
 *  @return Error
 */
+ (NSError *)createErrorWithCode:(NSInteger) code withDesc:(NSString *)desc;


/**
 *  创建一个第三方错误
 *
 *  @param desc 错误描述
 *
 *  @return Error
 */
+ (NSError *)createThirdError:(NSString *)desc;

@end



@interface NSError(CodeAndDesc)

- (NSString *)errorDescription;

@end