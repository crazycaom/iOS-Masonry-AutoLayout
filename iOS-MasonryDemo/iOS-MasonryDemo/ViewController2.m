//
//  ViewController2.m
//  iOS-MasonryDemo
//
//  Created by CaoMeng on 2017/4/11.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "ViewController2.h"
#import <Masonry.h>

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     
     无论在什么尺寸的设备上（包括横竖屏切换），黑色view的左、上边距、大小都不变；
     灰色view的右边距不变
     宽、高、上边距黑色view相等
     
     */
    
    
    
    // 初始化黑色view
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    // 给黑色view添加约束
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(100, 100));
        // 添加左、上边距约束（左、上约束都是20）
        //make.left.and.top.mas_equalTo(20);
        
        // 添加左边约束为20
        make.left.mas_equalTo(20);
        
        // 添加上边约束为80
        make.top.mas_equalTo(80);
        
    }];
    
    // 初始化灰色view
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    // 给灰色view添加约束
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 大小、上边距约束与黑色view相同
        make.size.and.top.equalTo(blackView);
        // 添加右边距约束（这里的间距是有方向性的，左、上边距约束为正数，右、下边距约束为负数）
        make.right.mas_equalTo(-20);
    }];
    
    
    /*
     
     ps:
     在上面的案例中，涉及以下内容：
     在Masonry中，and,with都没有具体操作，仅仅是为了提高程序的可读性make.left.and.top.mas_equalTo(20);等价于make.left.top.mas_equalTo(20);
     
     equalTo与mas_equalTo如果约束条件是数值或者结构体等类型，可以使用mas_equalTo进行包装。关于这个问题，我也不是很清楚，可以看看官方的解释：
     Instead of using NSNumber, you can use primitives and structs to build your constraints.By default,macros which support autoboxing are prefixed with mas_.Unprefixed versions are available by defining MAS_SHORTHAND_GLOBALSbefore importing Masonry.
     
     我一般将数值类型的约束用mas_equalTo，而相对于某个控件，或者某个控件的某个约束，我会使用equalTo，如：make.size.mas_equalTo(CGSizeMake(100, 100));make.center.equalTo(weakSelf.view);
     
     */
    
}

@end
