//
//  ViewController3.m
//  iOS-MasonryDemo
//
//  Created by CaoMeng on 2017/4/11.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "ViewController3.h"
#import <Masonry.h>

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     
     
     案例三：
     要求：
     有两个view，黑色与灰色；
     黑色view的左、上、右边距均为20，下边距灰色view 20，宽度自适应，高度与灰色view平分整个界面；
     灰色view宽度为黑色view的一半（即左边以中线起始），右、下边距与黑色view相同，高度与黑色view相同。
     
     
     */
    
    
    // 初始化黑色view
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    // 给黑色view添加约束
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加左、上边距约束
        //make.left.and.top.mas_equalTo(20);
        
        // 添加左边边距为20
        make.left.mas_equalTo(20);
        
        // 上边边距为80
        make.top.mas_equalTo(80);
        
        // 添加右边距约束
        make.right.mas_equalTo(-20);
    }];
    
    // 初始化灰色view
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    // 给灰色view添加约束
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加右、下边距约束
        make.bottom.and.right.mas_equalTo(-20);
        
        // 添加高度约束，让高度等于黑色view
        make.height.equalTo(blackView);
       
        // 添加上边距约束（上边距 = 黑色view的下边框 + 偏移量20）
        make.top.equalTo(blackView.mas_bottom).offset(20);
        
        // 添加左边距（左边距 = 父容器纵轴中心 + 偏移量0）
        make.left.equalTo(self.view.mas_centerX).offset(0);
    }];
    
}

@end
