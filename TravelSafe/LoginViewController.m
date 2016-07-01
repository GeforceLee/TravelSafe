//
//  LoginViewController.m
//  TravelSafe
//
//  Created by Yunlong Li on 16/7/1.
//  Copyright © 2016年 ezutrip. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarController.h"
#import "HttpManager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self performSegueWithIdentifier:@"MainTabBarController" sender:self];
    
    
    [[HttpManager sharedHttpManager] post:@"v1/sms/captcha" withParam:@{@"type": @"registry",@"mobile":@"13466739594"} andResult:^(id result, NSError *error) {
        
    }];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self performSegueWithIdentifier:@"MainTabBarController1" sender:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


@end
