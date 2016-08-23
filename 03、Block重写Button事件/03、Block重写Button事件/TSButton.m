//
//  TSButton.m
//  03、Block重写Button事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
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
