//
//  TSButton.m
//  03、block对button传值
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "TSButton.h"

@interface TSButton (){
    
    HandleBlock _block;

}

@end

@implementation TSButton


- (void)buttonHandle:(HandleBlock)handle {
    
    _block = handle;
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction {
    
    if (_block) {
        
        _block();
    }
}


@end
