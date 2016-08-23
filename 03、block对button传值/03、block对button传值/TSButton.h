//
//  TSButton.h
//  03、block对button传值
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HandleBlock)();

@interface TSButton : UIButton


- (void)buttonHandle:(HandleBlock)handle;

@end
