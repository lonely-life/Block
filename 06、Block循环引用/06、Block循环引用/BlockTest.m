//
//  BlockTest.m
//  06、block循环引用
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "BlockTest.h"

//当前类中的Block，定义其的别名
typedef void(^MyBlock)();

@interface BlockTest ()

//当前变量
@property (nonatomic, copy) MyBlock myBlock;

//当前属性
@property (nonatomic, strong) NSString *obj;

@end

@implementation BlockTest

- (void)blockTest {
    /**
    第一种方法：
    使用__weak 关键字修饰，weakSelf 使用弱引用，也就表示self 也使用了弱引用修饰， 修饰后block 内部就不会对self持有，也就不会导致循环引用
    如果当前self类需要使用当前类中的属性和实例方法，那么我们需要将其中的一个设置成为弱引用，就像这个一样的：
    注意：
     这里转换的弱引用“__weak”是双划线而不是单划线
     **/
    __weak typeof(self)weakSelf = self;
    //
    //    // __block typeof(self)weakSelf = self; // 手动管理里面使用__block修饰
    
    //当前类使用当前类中的属性和实例方法，需要将其中一个转换格式为弱引用
    self.myBlock = ^{
        
        // 使用当前对象的实例变量会导致循环引用
        weakSelf.obj = @"flasjflads";
        
        // 使用了当前对象的实例方法也会导致循环引用
        [weakSelf method];
    };
    
    self.myBlock();
    
    
    //当前类中的Block来引用当前类中的属性和实例方法
    MyBlock block = ^{
        
        // 使用当前对象的实例变量会导致循环引用
        self.obj = @"flasjflads";
        
        // 使用了当前对象的实例方法也会导致循环引用
        [self method];
    };
    
    block();
}


/******
    当上面的引用成功引用时，切不是死循环引用时，就会调用下面的两个实例方法，
 当上面的引用出现失误，或者变成死循环引用时，便不会调用下面的方法。
 也可以换一种方法来理解，那就是下边的这两个方法，其实质就是为了检测上面的引用是不是成功了 是不是死循环引用
 ***/
- (void)method {
    
    NSLog(@"method");
}

- (void)dealloc {
    
    NSLog(@"dealloc");
}

@end
