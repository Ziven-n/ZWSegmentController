//
//  OneViewController.m
//  ZWSegmentController
//
//  Created by zzw on 17/2/24.
//  Copyright © 2017年 Mapgoo. All rights reserved.
//

#import "OneViewController.h"
#import "MGSegmentController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor = [UIColor redColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //
    NSArray *array = @[@"维护",@"拆机"];
    OneViewController *oneVC = [[OneViewController alloc] init];
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    NSArray *vcarray = @[oneVC,twoVC,threeVC];
    
    
    MGSegmentController *zwVC = [[MGSegmentController alloc] initWithTitleArray:array AndVCArray:vcarray];
    [self.navigationController pushViewController:zwVC animated:YES];;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
