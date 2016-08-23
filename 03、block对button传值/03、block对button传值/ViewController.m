//
//  ViewController.m
//  03、block对button传值
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "ViewController.h"
#import "TSButton.h"

@interface ViewController ()
//封装button
@property (nonatomic, strong) TSButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    
    
    // UIAlertController *
}

- (TSButton *)button {
    
    if (!_button) {
        
        _button = [TSButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(40, 100, 300, 50);
        _button.backgroundColor = [UIColor blueColor];
        [_button buttonHandle:^{
            
            NSLog(@"按钮的处理事件");
        }];
    }
    
    return _button;
}

@end
