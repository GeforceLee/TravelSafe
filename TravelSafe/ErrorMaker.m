//
//  ErrorMaker.m
//  TravelSafe
//
//  Created by geforce on 16/6/3.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import "ErrorMaker.h"

#define ERROR_DOMAIN @"com.ezutrip.travelsafe"

@implementation ErrorMaker
+ (NSError *)createError{
    NSDictionary *dict = [[NSDictionary alloc] init];
    
    NSError *error = [NSError alloc] initWithDomain:ERROR_DOMAIN [code: userInfo:dict];
    return error;
}
@end
