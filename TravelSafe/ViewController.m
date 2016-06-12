//
//  ViewController.m
//  TravelSafe
//
//  Created by LiYunlong on 16/6/2.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyUtil.h"
#import "HttpManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [HttpManager sharedHttpManager];
    [CurrencyUtil currencyFrom:@"USD" to:@"CNY" amount:1 result:^(NSDictionary *result, NSError *error) {
        if (error) {
            
        }else{
            
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
