//
//  TSButton.h
//  03、Block重写Button事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HandleBlock)();





@interface TSButton : UIButton


-(void)blockHandle:(HandleBlock)handle;

@end
