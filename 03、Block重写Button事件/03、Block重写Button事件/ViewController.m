//
//  ViewController.m
//  03、Block重写Button事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
//

#import "ViewController.h"
#import "TSButton.h"

@interface ViewController ()

//定义一个全局的button，这样尽可以直接在外部封装创建button了而不用在主函数中去创建
@property (nonatomic, strong) TSButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
     button.frame = CGRectMake(20, 100, 300, 20);
     button.backgroundColor = [UIColor orangeColor];
     
     
     //这个是直接创建button的时候用来触发的button的触发事件
     [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
     
     */
    
    
    //当我们利用block创建好的button后，还是需要在主函数中将其添加到self.view上的
    [self.view addSubview:self.button];
    
    
    // UIAlertController *
}


//这个是利用Block来对button进行重写，这样的话就不用直接对button还设置什么触发事件了
- (TSButton *)button {
    
    if (!_button) {
        
        _button = [TSButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(20, 100, 300, 50);
        _button.backgroundColor = [UIColor orangeColor];
        
        //这里就是直接将button的触发事件通过Block来触发，而不用像下面那个样的还需要单独创建一个方法来实现button的触发事件
        [_button blockHandle:^{
            NSLog(@"button的重写事件");
        }];
    }
    
    return _button;
}


//这个是直接通过触发事件来进行button的点击触发事件
//- (void)buttonAction {
//
//    NSLog(@"sdadadadas");
//}

@end
