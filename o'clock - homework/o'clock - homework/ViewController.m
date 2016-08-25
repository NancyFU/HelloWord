//
//  ViewController.m
//  o'clock - homework
//
//  Created by tens04 on 16/8/24.
//  Copyright (c) 2016年 tens04. All rights reserved.

#import "ViewController.h"
#define kClockW [UIScreen mainScreen].bounds.size.width
#define perSecondA 6        // 1秒6度(秒针)
#define perMintueA 6        // 1分钟6度(分针)
#define perHourA 30         // 1小时30度（时针）
#define perMinHourA 0.5     // 每分钟时针转(30 / 60 °)
#define angle2radion(angle) ((angle) / 180.0 * M_PI)   //将角度转化为弧度

@interface ViewController ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) CALayer *layerS;
@property (strong, nonatomic) CALayer *layerM;
@property (strong, nonatomic) CALayer *layerH;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.imageView];
    [self.view.layer addSublayer:self.layerH];
    [self.view.layer addSublayer:self.layerM];
    [self.view.layer addSublayer:self.layerS];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

//设置背景图片
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dial"]];
        _imageView.center = self.view.center;
    }
    return _imageView;
}

//放置图片时，必须从下到到上放，所以先放时针、其次分针、最后秒针
- (CALayer *)layerH {
    if (!_layerH) {
        _layerH = [[CALayer alloc]init];
        _layerH.bounds = CGRectMake(0, 0, 27, 120);
        //设置定位点在视图中心
        _layerH.position = self.view.center;
        //设置锚点在定位点的一半上
        _layerH.anchorPoint = CGPointMake(0.5, 1);
        //填充图片时，需要用桥接
        _layerH.contents = (__bridge id )([UIImage imageNamed:@"hourHand"].CGImage);
    }
    return _layerH;
}

- (CALayer *)layerM {
    if (!_layerM) {
        _layerM = [[CALayer alloc]init];
        _layerM.bounds = CGRectMake(0, 0, 21, 128);
        _layerM.position = self.view.center;
        _layerM.anchorPoint = CGPointMake(0.5, 1);
        _layerM.contents = (__bridge id )([UIImage imageNamed:@"minuteHand"].CGImage);
    }
    return _layerM;
}

- (CALayer *)layerS {
    if (!_layerS) {
        // 1、创建layer
        _layerS = [[CALayer alloc] init];
        // 1、bounds： 尺寸
        _layerS.bounds = CGRectMake(0, 0, 9, 150);
        // 2、position: 定位点
        _layerS.position = self.view.center;
        
        // 3、锚点、支点：决定layer上的哪个点在 position 点上，默认(0.5, 0.5)，范围：（0，0） ~ （1，1）
        _layerS.anchorPoint = CGPointMake(0.5, 1);
        
        // 3、填充图片内容，需要将 UIImage 桥接(__bridge)到CGImage
        _layerS.contents = (__bridge id )([UIImage imageNamed:@"secondHand"].CGImage);
    }
    return _layerS;
}

//获取当前系统时间
- (void)timeChange{
    
    //获取日历
    NSCalendar * calender = [NSCalendar currentCalendar];
    //获取秒、分、小时
    NSDateComponents * cmp = [calender components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour  fromDate:[NSDate date]];
    
    CGFloat second = cmp.second;
    
    //秒数*度数
    CGFloat secondA = (second * perSecondA) ;
    
    NSInteger minute = cmp.minute;
    
    CGFloat mintuteA = minute * perMintueA ;
    
    NSInteger hour = cmp.hour;
    
    CGFloat hourA = hour * perHourA  + minute * perMinHourA;
    
    _layerS.transform = CATransform3DMakeRotation(angle2radion(secondA), 0, 0, 1);
    
    _layerM.transform = CATransform3DMakeRotation(angle2radion(mintuteA), 0, 0, 1);
    
    _layerH.transform = CATransform3DMakeRotation(angle2radion(hourA), 0, 0, 1);
}


@end




