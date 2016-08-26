//
//  ViewController.m
//  03、CAKeyframeAnimation
//
//  Created by tens04 on 16/8/26.
//  Copyright (c) 2016年 tens04. All rights reserved.
//

#import "ViewController.h"
    
#define TScreenWidth [UIScreen mainScreen].bounds.size.width
#define TScreenHeight [UIScreen mainScreen].bounds.size.height
    
    @interface ViewController (){
        
        CALayer *aniLayer;
    }
    
    @end
    
    @implementation ViewController
    
    - (void)viewDidLoad {
        [super viewDidLoad];
        
        CALayer *bgLayer = [CALayer layer];
        bgLayer.frame = self.view.bounds;
        bgLayer.backgroundColor = [UIColor blackColor].CGColor;
        [self.view.layer addSublayer:bgLayer];
        bgLayer.delegate = self;
        
        // 重绘
        [bgLayer setNeedsDisplay];
        
        
        aniLayer = [CALayer layer];
        aniLayer.bounds = CGRectMake(0 , 0, 100, 100);
        aniLayer.position = CGPointMake(TScreenWidth / 2, 50);
        aniLayer.contents = (__bridge id )([UIImage imageNamed:@"足球"].CGImage);
        [self.view.layer addSublayer:aniLayer];
        
        
        
        
    }
    
    
    - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        
        
        [aniLayer addAnimation:[self keyframeAnimation] forKey:@"keyAnimation"];
    }
    
    
    - (CAAnimation *)keyframeAnimation {
        
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyAnimation.duration = 4;
        //    keyAnimation.autoreverses = YES;
        keyAnimation.repeatCount = HUGE_VALF;
        keyAnimation.fillMode = kCAFillModeForwards;
        keyAnimation.removedOnCompletion = NO;
        
        
        /*
         NSValue *point_1 = [NSValue valueWithCGPoint:CGPointMake(TScreenWidth / 2,0)];
         NSValue *point_2 = [NSValue valueWithCGPoint:CGPointMake(50,TScreenHeight / 2)];
         NSValue *point_3 = [NSValue valueWithCGPoint:CGPointMake(TScreenWidth / 2,TScreenHeight - 50)];
         NSValue *point_4 = [NSValue valueWithCGPoint:CGPointMake(TScreenWidth - 50,TScreenHeight / 2)];
         NSValue *point_5 = [NSValue valueWithCGPoint:CGPointMake(TScreenWidth / 2,0)];
         
         // values:设置关键帧(多个目标点)
         keyAnimation.values = @[point_1,point_2,point_3,point_4,point_5];
         
         // 设置每一帧所在的时间比例
         keyAnimation.keyTimes = @[@0, @0.2, @0.5, @0.6,@1.0];
         
         */
        /* 插值计算模式：
         kCAAnimationLinear  关键帧之间进行插值计算（线性的）
         kCAAnimationDiscrete 关键帧之间不进行插值计算（离散的）
         kCAAnimationPaced 关键帧之间匀速切换，keyTimes\timingFunctions的设置将不起作用
         kCAAnimationCubic 关键帧进行圆滑曲线相连后插值计算
         kCAAnimationCubicPaced 匀速并且关键帧进行圆滑曲线相连后插值计算
         */
        keyAnimation.calculationMode = kCAAnimationLinear;
        
        
        keyAnimation.path = [self path].CGPath;
        
        return keyAnimation;
        
    }
    
    
    // 绘制路径
    - (UIBezierPath *)path {
        
        // 椭圆
        //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.view.bounds];
        // 圆角矩形
        //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds cornerRadius:50];
        // 内切圆
        //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 100, 300, 300)];
        
        // 贝塞尔曲线
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, TScreenHeight)];
        CGPoint point_1 = CGPointMake(TScreenWidth, TScreenHeight);
        CGPoint controPoint_1 = CGPointMake(TScreenWidth / 2, - TScreenHeight);
        //    CGPoint controPoint_2 = CGPointMake(TScreenWidth / 4 * 3, TScreenHeight);
        
        [path addQuadCurveToPoint:point_1 controlPoint:controPoint_1];
        //    [path addCurveToPoint:point_1 controlPoint1:controPoint_1 controlPoint2:controPoint_2];
        
        return path;
    }
    
    
    // 绘图
    - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
        
        CGContextAddPath(ctx , [self path].CGPath);
        CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
        CGContextSetLineWidth(ctx, 5);
        CGContextDrawPath(ctx, kCGPathStroke);
    }
    
    
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    @end
