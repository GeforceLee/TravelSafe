//
//  CommonDefine.h
//  TravelSafe
//
//  Created by LiYunlong on 16/6/12.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h
/**
 *  处理返回结果的的Block
 *
 *  @param result 返回结果
 *  @param error  错误,如果没错是nil
 */
typedef void (^handleResultBlock)(id result,NSError *error);


#define CurrencyAPIKEY @"b8e7a77ad7b7e961cda8aef8b9df73a7"


#ifdef DEBUG
#define DebugLog(s, ...) NSLog(s, ##__VA_ARGS__)
#define ServerURL @""
#define HttpLog 1


#else
#define DebugLog(s, ...)
#define ServerURL @""
#define HttpLog 0
#endif







#endif /* CommonDefine_h */
