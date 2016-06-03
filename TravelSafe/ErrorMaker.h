//
//  ErrorMaker.h
//  TravelSafe
//
//  Created by geforce on 16/6/3.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,TSErrorType) {
    TSErrorTypeThird=0
};
@interface ErrorMaker : NSObject

+ (NSError *)createError;


@end
