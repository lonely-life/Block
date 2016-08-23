//
//  ViewController.m
//  05、block内存管理
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "ViewController.h"

/***
 从以下的例子中我们可以看出来，Block其实在处理内存时也是实用的，但是Block在管理内存时，其实质还是手动管理内存，这在现在这个只能遍地走的时代是不使用
 现在还依然还在使用手动管理内存的只有一些大型的网络游戏，但是我们也需要去明白Block在管理内存时的原理
 Block在挂历内存时存在三种情况：
 self内部使用局部变量引用当前对像内存+1，
 内部变量引用当前对象+1，但是当前计数self会+1
 内部属性引用当前对象+1，但是当前计数sel+1
 
 三者之间存在一定的区别，但是一般来说多数都是在使用内部变量引用当前对象
 **/

typedef void(^MyBlock)();

@interface ViewController () {
    
    //局部变量，用局部变量来引用当前对象时，内存+1
    NSObject *_hObject;
}

//内部变量，自身内存+1，引用计数+1
@property (nonatomic, retain) NSObject *pObject;

//内部属性，自身内存+1，引用计数+1
@property (nonatomic, copy)MyBlock myblock;

@end

//static NSObject *sObject;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //局部变量引用当前对象
    NSObject *object = [[NSObject alloc] init];
    NSLog(@"object:%ld",[object retainCount]);
    
    //内部变量引用当前对象
    _hObject = [[NSObject alloc] init];
    NSLog(@"_hObject: %ld",[_hObject retainCount]);
    
    //内部属性引用当前对象
    _pObject = [[NSObject alloc] init];
    NSLog(@"pObject: %ld",[_pObject retainCount]);
    
    //    sObject = [[NSObject alloc] init];
    //    NSLog(@"sObject: %ld",[sObject retainCount]);
    
    self.myblock = ^{
        // 内部使用局部的对象时，会对这个对象引用计数 +1
        NSLog(@"object:%ld",[object retainCount]);
        
        // 内部使用对象的实例变量，实例变量引用计数不会 +1,但是当前对象(self)的引用计数 +1
        NSLog(@"_hObject: %ld",[_hObject retainCount]);
        
         // 内部使用了对象属性，这个属性的引用计数不会 +1,但是当前对象(self)的引用计数 +1
        NSLog(@"pObject: %ld",[_pObject retainCount]);
        
        //         NSLog(@"sObject: %ld",[sObject retainCount]);
        
    };
    
    self.myblock();
    
    //计算总共占用的内存大小
    NSLog(@"self: %ld",[self retainCount]);
}



@end
