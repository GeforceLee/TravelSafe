//
//  CurrencyUtil.m
//  TravelSafe
//
//  Created by geforce on 16/6/3.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import "CurrencyUtil.h"
#import "APIStoreSDK.h"
#import "ErrorMaker.h"
@implementation CurrencyUtil
+ (NSArray *)supportCurrencyTypes{
    return @[@"AED",@"AFN",@"ALL",@"AMD",@"ANG",@"AOA",@"ARS",@"AUD",@"AWG",@"AZN",@"BAM",@"BBD",@"BDT",@"BGN",@"BHD",@"BIF",@"BMD",@"BND",@"BOB",@"BRL",@"BSD",@"BTN",@"BWP",@"BYR",@"BZD",@"CAD",@"CDF",@"CHF",@"CLF",@"CLP",@"CNH",@"CNY",@"COP",@"CRC",@"CUP",@"CVE",@"CYP",@"CZK",@"DEM",@"DJF",@"DKK",@"DOP",@"DZD",@"ECS",@"EGP",@"ERN",@"ETB",@"EUR",@"FJD",@"FKP",@"FRF",@"GBP",@"GEL",@"GHS",@"GIP",@"GMD",@"GNF",@"GTQ",@"GYD",@"HKD",@"HNL",@"HRK",@"HTG",@"HUF",@"IDR",@"IEP",@"ILS",@"INR",@"IQD",@"IRR",@"ISK",@"ITL",@"JMD",@"JOD",@"JPY",@"KES",@"KGS",@"KHR",@"KMF",@"KPW",@"KRW",@"KWD",@"KYD",@"KZT",@"LAK",@"LBP",@"LKR",@"LRD",@"LSL",@"LTL",@"LVL",@"LYD",@"MAD",@"MDL",@"MGA",@"MKD",@"MMK",@"MNT",@"MOP",@"MRO",@"MUR",@"MVR",@"MWK",@"MXN",@"MXV",@"MYR",@"MZN",@"NAD",@"NGN",@"NIO",@"NOK",@"NPR",@"NZD",@"OMR",@"PAB",@"PEN",@"PGK",@"PHP",@"PKR",@"PLN",@"PYG",@"QAR",@"RON",@"RSD",@"RUB",@"RWF",@"SAR",@"SBD",@"SCR",@"SDG",@"SEK",@"SGD",@"SHP",@"SIT",@"SLL",@"SOS",@"SRD",@"STD",@"SVC",@"SYP",@"SZL",@"THB",@"TJS",@"TMT",@"TND",@"TOP",@"TRY",@"TTD",@"TWD",@"TZS",@"UAH",@"UGX",@"USD",@"UYU",@"UZS",@"VEF",@"VND",@"VUV",@"WST",@"XAF",@"XAG",@"XAU",@"XCD",@"XCP",@"XDR",@"XOF",@"XPD",@"XPF",@"XPT",@"YER",@"ZAR",@"ZMW",@"ZWL"];
}


+ (void)currencyFrom:(NSString *)from to:(NSString *)to amount:(float)amount result:(handleResultBlock)block{
    
    
    if([[CurrencyUtil supportCurrencyTypes] indexOfObject:from]!= -1 || [[CurrencyUtil supportCurrencyTypes] indexOfObject:to]!= -1){
        NSError *error;
        return block(nil,error);
    }
    
    
    //实例化一个回调，处理请求的返回值
    APISCallBack* callBack = [APISCallBack alloc];
    
    callBack.onSuccess = ^(long status, NSString* responseString) {
        
        if(responseString != nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
            if (dict) {
                block(dict,nil);
            }else {
                NSError *error = [ErrorMaker createThirdError:@""];
                block(nil,error);
            }
        }
    };
    
    callBack.onError = ^(long status, NSString* responseString) {
        NSError *error = [ErrorMaker createThirdError:@""];
        block(nil,error);
        
    };
    
    //部分参数
    NSString *uri = @"http://apis.baidu.com/apistore/currencyservice/currency";
    NSString *method = @"get";
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setObject:from forKey:@"fromCurrency"];
    [parameter setObject:to forKey:@"toCurrency"];
    [parameter setObject:[NSNumber numberWithFloat: amount] forKey:@"amount"];
    [ApiStoreSDK executeWithURL:uri method:method apikey:CurrencyAPIKEY parameter:parameter callBack:callBack];

}
@end
