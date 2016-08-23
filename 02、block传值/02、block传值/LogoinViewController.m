//
//  ViewController.m
//  02、使用block处理值传递
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "LogoinViewController.h"
#import "RegistViewController.h"

@interface LogoinViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxf;

@end

@implementation LogoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    RegistViewController *registVC = segue.destinationViewController;
    
    NSString *userName = @"aaaaaa";
    NSString *password = @"111111";
    
    [registVC loadUserName:userName password:password];
    
    // 定义block, 接收调用时传入的参数
    registVC.userBlock = ^(NSString *userName, NSString *password) {
        
        self.userNameTxf.text = userName;
        self.passwordTxf.text = password;
    };
    

}


@end
