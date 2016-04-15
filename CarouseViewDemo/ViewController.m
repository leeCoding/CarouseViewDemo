//
//  ViewController.m
//  CarouseViewDemo
//
//  Created by Jonny on 16/4/15.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "ViewController.h"
#import "LTCarouseView.h"
@interface ViewController ()<LTCarouseViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    LTCarouseView *carouseView = [[LTCarouseView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    carouseView.imageAry = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"]];
    carouseView.pageColor = [UIColor whiteColor];
//    NSString *url = @"http://123.57.245.43/nyzc/storage/web/source/1/b2qzxGHwrwHnzagMpHN3QQLIEETDGPCj.jpg";
//    NSString *url1 = @"http://123.57.245.43/nyzc/storage/web/source/1/c0pSr2eo3s0mZYexZf8b4BRaKeUdrkxb.jpg";
    
//    carouseView.imageURLAry = @[url,url1];
    
    [self.view addSubview:carouseView];
}

#pragma mark - LTCarouseViewDelegate
- (void)clickWithImageView:(LTCarouseView *)carouseView index:(NSInteger)index {
    
     NSLog(@" 选择了第%ld张图片",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
