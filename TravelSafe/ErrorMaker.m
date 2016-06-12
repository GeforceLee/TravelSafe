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

+ (NSError *)createErrorWithCode:(NSInteger) code withDesc:(NSString *)desc{
    NSDictionary *dict = [[NSDictionary alloc] init];
    [dict setValue:desc forKey:ErrorCodeDesc];
    NSError *error = [[NSError alloc] initWithDomain:ERROR_DOMAIN code:code userInfo:dict];
    return error;
}


+ (NSError *)createThirdError:(NSString *)desc{
    return [ErrorMaker createErrorWithCode:TSErrorTypeThird withDesc:desc];
}

@end

@implementation NSError(CodeAndDesc)

- (NSString *)errorDescription{
    return [self.userInfo objectForKey:ErrorCodeDesc];
}

@end