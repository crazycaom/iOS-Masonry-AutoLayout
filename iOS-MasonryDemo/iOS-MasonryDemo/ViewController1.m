//
//  ViewController1.m
//  iOS-MasonryDemo
//
//  Created by CaoMeng on 2017/4/11.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "ViewController1.h"
#import <Masonry.h>

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     
     案例一：
     要求：无论在什么尺寸的设备上（包括横竖屏切换），红色view都居中显示。
     
     */
    
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // 使用mas_makeConstraints添加约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(200, 100));
        // 添加居中约束（居中方式与self相同）
        make.center.equalTo(self.view);
    }];
}


@end
