//
//  ViewController.m
//  ZWSegmentController
//
//  Created by zzw on 17/2/24.
//  Copyright © 2017年 Mapgoo. All rights reserved.
//

#import "ViewController.h"
#import "MGSegmentController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSArray *array = @[@"新装",@"维护",@"拆机"];
    OneViewController *oneVC = [[OneViewController alloc] init];
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    
    NSArray *vcarray = @[oneVC,twoVC,threeVC];
    
    MGSegmentController *zwVC = [[MGSegmentController alloc] initWithTitleArray:array AndVCArray:vcarray];
    
    [self.navigationController pushViewController:zwVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
