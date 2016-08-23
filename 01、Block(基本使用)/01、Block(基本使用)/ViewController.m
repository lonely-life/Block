//
//  ViewController.m
//  01、Block(基本使用)
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/**
 使用typedof 定义block 类型： 定义一个名称为SumBlock 类型为void(^)(int, int)
 当我们在使用Block时会发现，每次书写block都会带来一长串的代码，所以我们可以通过C语言之前学习的命名，将block重新命名为一个简单的名字，这样在下边需要使用到时就不会那么麻烦了
 void是代表着返回值类型，
 ^SumBlock是代表着重新命名的函数名
 （int a，int b）是代表着block中的传入数据，甚至可以说是block中的主要数据
 **/
 typedef void(^SumBlock)(int a, int b);

@implementation ViewController


//c语言中的函数结构体
int funtion (int a, int b){

    return a + b;
}
/****
 同C语言中的函数结构体相比我们可以看出来其实Block函数与C语言中的函数结构体还是很相似的，都是前面一个返回值类型 + 名字 + （数据）
 ***/


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /****
     其实这就是一个block，在使用block时其关键的符号是“^”，也可以说这个已经成为了block的一个标志性符号
     {}中的是代码块，是实现Block的代码块
     ***/
    [UIView animateWithDuration:0.2 animations:^{
        
    }];
    
//---------------------函数指针-------------------------
    int (*p)(int, int) = funtion;
    
    NSLog(@" %d",p(10,20));
    
    
// ----------------------------Block---------------------------
    
    // int a = 100;
    
    /**** 
     1、block基本定义
     myBlock block变量的名称，a、b 参数， 
     ^(int a, int b) {return  a + b;} block体;
     就像下边的这个函数体一样的，在这个函数体中我们可以看出来，block就是一个函数，只是这是一个特殊的函数，这个函数可以在函数内部调用，可以在函数内部去定义这个函数，只是需要注意的是block虽然是一个函数，但是当我们将
     
    ***/
    int (^myBlock)(int a, int b) = ^(int a, int b) {
        
        return  a + b;
    };
    
    int sum = myBlock(10,20);
    NSLog(@"sum = %d",sum);
    
    
    void (^vBlock)(int a) = ^(int a) {
        
        NSLog(@"a = %d",a);
    };
    vBlock(100);
    
    void (^mBlock)() = ^{
        
        NSLog(@"这是没有返回值没有参数的block'");
    };
    
    mBlock();
    
    
    
    // 调用带有bolck参数的方法，这里是当Block作为函数参数使用时的调用
    [self sumMothod:^void (int a, int b) {
        
        NSLog(@"a + b = %d",a + b);
    }];
    
    
    [self sum_Mothod:^(int a, int b) {
        
        NSLog(@"a + b = %d", a + b);
    }];
    
    
    
    // 使用SumBlokc 类型定义block 变量
    SumBlock sBlock = ^(int a, int b) {
        
        NSLog(@"%d", a + b);
    };

    

}
/****
 注意，当我们将block作为函数参数或者方法参数使用时，需要在主函数- (void)viewDidLoad 里面进行调用，不然不能将其实现功能，
 其实，从这里我们可以看出来当block 作为函数参数或者方法参数使用时，多数都是只是为了传值而不是为了进行方法的传递，具体方法的使用还是在主函数中去实现的
 ***/

// block 作为函数参数时的使用
int sumFunction(int (^sumBlock)(int a, int b)) {
    
    return sumBlock(100,200);
}

// block 作为方法的参数时的使用
- (void)sumMothod:(void (^)(int a, int b))sumBlock {
    
    sumBlock(200,300);
}


/***
 通过下面这个函数方法与上面两个函数方法之间的比较我们可以看出来当我们定义的block的别名之后我们的整体代码块都简化了很多
 但是需要注意的时无论是定义另类的别名还是直接使用Block函数，我们的目的都是为了使其实现功能，所以有时候如果不方便定义别名可以直接使用Block函数
 
 ****/
// typedef void(^SumBlock)(int a, int b);
- (void)sum_Mothod:(SumBlock)sumBlock {
    
    sumBlock(1000,1000);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
