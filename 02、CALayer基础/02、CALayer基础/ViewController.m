//
//  ViewController.m
//  02、CALayer基础
//
//  Created by tens04 on 16/8/24.
//  Copyright (c) 2016年 tens04. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    // layer.frame = CGRectMake(0, 100, 350, 200);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    
    // 1、bounds： 尺寸
    layer.bounds = CGRectMake(0, 0, 200, 200);
    // 2、position: 定位点
    layer.position = self.view.center;
    
    // 3、锚点、支点：决定layer上的哪个点在 position 点上，默认(0.5, 0.5)，范围：（0，0） ~ （1，1）
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    // 4、z方向的层级
    layer.zPosition = 2;
    
    // 5、设置圆角：cornerRadius
    layer.cornerRadius = 100;
    
    // 6、填充内容
    // layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"image6.jpg"].CGImage);
    
    layer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"juhua"]].CGColor;
    
    // 7、是否可以裁剪多余的图层
    // layer.masksToBounds = YES;
    
    // 8、设置边框宽度和颜色
    layer.borderWidth = 5;
    layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    // 9、设置阴影: 尺寸、颜色、透明度、圆角
    layer.shadowOffset = CGSizeMake(10, 5);
    layer.shadowColor = [UIColor redColor].CGColor;
    layer.shadowOpacity = 0.5;
    layer.shadowRadius = 10;
    
    
    
    
    [self.view.layer addSublayer:layer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
