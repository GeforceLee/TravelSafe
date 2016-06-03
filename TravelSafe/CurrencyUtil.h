//
//  CurrencyUtil.h
//  TravelSafe
//
//  Created by geforce on 16/6/3.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^currencyResultBlock)(NSDictionary *result,NSError *error);
@interface CurrencyUtil : NSObject
+ (NSArray *)supportCurrencyTypes;

+ (void)currencyFrom:(NSString *)from to:(NSString *)to amount:(float)amount result:(currencyResultBlock)block;

@end
