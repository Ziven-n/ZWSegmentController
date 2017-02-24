//
//  MGSegmentController.m
//  MGSegmentController
//
//  Created by zzw on 17/2/24.
//  Copyright © 2017年 Mapgoo. All rights reserved.
//

#import "MGSegmentController.h"


// 屏幕宽
#define kScreenW  [[UIScreen mainScreen] bounds].size.width
// 屏幕高
#define kScreenH  [[UIScreen mainScreen] bounds].size.height

// 颜色色值设置
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r, g, b)        RGBA(r, g, b, 1.0f)

@interface MGSegmentController ()

@property (nonatomic,strong) NSMutableArray *titleArray;            //传进来的title数组
@property (nonatomic,strong) NSMutableArray *buttonArray;           //创建的切换Button
@property (nonatomic,strong) UILabel *lineLable;                    //下划线
@property (nonatomic,strong) UIViewController *currentViewController;//当前的vc
@property (nonatomic,strong) NSArray *VCArray;

@end

@implementation MGSegmentController

- (void)dealloc {
    NSLog(@"页面已销毁");
}

- (instancetype)initWithTitleArray:(NSArray *)array AndVCArray:(NSArray *)vcArray; {
    self = [super init];
    
    _titleArray = array.mutableCopy;
    _buttonArray = @[].mutableCopy;
    _VCArray = vcArray.copy;
    
    [self creatNavBarWithArray:array];
    
    for (UIViewController *vc in _VCArray) {
        
        [self addChildViewController:vc];
        vc.view.frame = CGRectMake(0, 64+45, kScreenW, kScreenH-45-64);
    }
    
    return self;
}

- (void)creatNavBarWithArray:(NSArray *)array {
    
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, 45)];
    baseView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = RGB(235, 235, 240);
    [self.view addSubview:baseView];
    
    for (int i = 0; i<array.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = i+100;
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(kScreenW/array.count*i, 0, kScreenW/array.count, 45);
        if (i == 0) {
            button.enabled = NO;
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }else {
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [baseView addSubview:button];
        [_buttonArray addObject:button];
    }
    
    _lineLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 44, kScreenW/_titleArray.count-20, 1)];
    _lineLable.backgroundColor = [UIColor orangeColor];
    [baseView addSubview:_lineLable];
    
    self.currentViewController = self.VCArray[0];
    [self.view addSubview:((UIViewController *)self.VCArray[0]).view];
}

- (void)buttonClick:(UIButton *)button {
    
    //设置按钮颜色及下划线的位置
    [self setlineFrameWithTag:button.tag];
    UIViewController *vc = nil;
    switch (button.tag) {
        case 100:
            vc = self.VCArray[button.tag-100];
            break;
        case 101:
            vc = self.VCArray[button.tag-100];
            break;
        case 102:
            vc = self.VCArray[button.tag-100];
            break;
            
        default:
            break;
    }
    
    [self transitionFromViewController:self.currentViewController toViewController:vc duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
    }  completion:^(BOOL finished) {
        self.currentViewController = vc;
    }];

}

- (void)setlineFrameWithTag:(NSInteger)tag {
    
    //防止切换太快导致的bug
    for (UIButton *buttons in _buttonArray) {
        if (buttons.tag == tag) {
            buttons.enabled = NO;
        }else {
            buttons.enabled = YES;
        }
    }
    
    //设置下划线的动画效果
    [UIView animateWithDuration:.3 animations:^{
        _lineLable.frame = CGRectMake((tag-100)*kScreenW/_titleArray.count+10, 44, kScreenW/_titleArray.count-20, 1);
    } completion:^(BOOL finished) {
        for (UIButton *buttons in _buttonArray) {
            if (buttons.tag == tag) {
                [buttons setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            }else {
                [buttons setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            }
        }
    }];
}

@end
