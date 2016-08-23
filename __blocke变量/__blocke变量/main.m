//
//  main.m
//  __blocke变量
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>
/****
 为了方便我们分析__block变量的改变情况，我们将做如下的一些对比分析
 ******/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //通过这个代码，我们可以看出来其最后的值为500，这就表示当我们在外边调用了Block之后我们的值才进行运算
        int a = 100;
        int (^block)(int x, int y) = ^(int x,int y){
            return (x + y) *a;
        };
        //如果在这里没有调用Block，那么最后输出来的值就不会经过Block内部代码块的计算
        NSLog(@"%d",block(2,3));
        
        
        /****
         当我们没有在number前面添加__block 修饰词之前时，程序直接报错崩溃，说明：
         当我们需要在Block内部直接使用外部的变量时，需要给外部的变量前面添加修饰"__block"
         block内部要对局部变量修改要使用 __block关键字修饰
         
         注意：这里的下划线是双下滑线，而不是单下划线
        *****/
         __block int number = 3;
        void (^numBlock)() = ^{
            
            number = 5;
        };
        
        //这里是调用了一次block'内部的代码块，所以最后输出的值是Block内部代码块的值，而不再是原来最初赋值时的值了
        numBlock();
        
        NSLog(@"number = %d",number);
        
        
        
        /*****
         这里面执行时依然还是先输出v的值，然后在输出---v，其实也就是说，我们先将v的值进行一次拷贝放入vBlock中，这样输出来的v的值就是最开始赋值给v的值，
         然后在下边调用了一次vBlock方法之后，我们输出的值就是后面v从新赋值的200，并且程序执行到后边，输出的是---v。
         但是这并不会改变原来拷贝在vBlock中的v的值
         
         block内使用局部变量会对局部变量拷贝一份使用，也就是说block中使用的变量和外面的变量不再是同一个了。
        ***/
        int v = 100;
        void (^vBlock)() = ^{
            
            NSLog(@"v = %d",v);
        };
        
        v = 200;
        vBlock();
        
        NSLog( @"----v = %d",v);
        
        /****
          当我们给定义的变量给定修饰符__block 之后，将不再进行内部的拷贝了，而是直接进行第二次赋值，然后直接输出，其输出顺序也是从上至下
          使用__block修饰后就不会进行拷贝了，内部和外部都是同一个
        **/
        __block int n = 100;
        void (^nBlock)() = ^{
            
            NSLog(@"n = %d",n);
        };
        
        n = 200;
        nBlock();
        
        NSLog( @"---n = %d",n);
        

        
        
        
        
    }
    return 0;
}
