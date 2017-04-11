//
//  ViewController.m
//  iOS-MasonryDemo
//
//  Created by CaoMeng on 2017/4/11.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray                                 *_dataArray;
}

@property(nonatomic, strong) UITableView    *selectListTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"约束类型列表";
    
    _dataArray = @[@"ViewController1-单控件约束",
                   @"ViewController2-多控件左右约束",
                   @"ViewController3-多控件上下约束",
                   @"ViewController4-约束更新"];
    
    [self.view addSubview:self.selectListTableView];
    
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellName = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *jumpToVC;
    
    NSInteger index = indexPath.row;
    switch (index) {
        case 0:
            jumpToVC = [[ViewController1 alloc] init];
            break;
            
        case 1:
            jumpToVC = [[ViewController2 alloc] init];
            break;
            
        case 2:
            jumpToVC = [[ViewController3 alloc] init];
            break;
            
        case 3:
            jumpToVC = [[ViewController4 alloc] init];
            break;
            
        default:
            break;
    }
    
    
    jumpToVC.title = [_dataArray objectAtIndex:index];
    [self.navigationController pushViewController:jumpToVC animated:YES];
    
}



#pragma mark - get

- (UITableView *)selectListTableView{
    
    if(_selectListTableView){
        return  _selectListTableView;
    }
    
    _selectListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    _selectListTableView.dataSource = self;
    _selectListTableView.delegate = self;
    
    return _selectListTableView;
}

@end
