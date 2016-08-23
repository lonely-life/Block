//
//  BlockTest.h
//  06、Block循环引用
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>
/***
 这个主要是用来介绍怎么样实现Block的循环引用，以及怎么解决在block中的死循环引用
 在Block中如果不能理解怎么解决死循环引用，那么久说明你对于Block根本就没有弄明白，
 在Block中造成死循环引用的原因是因为：
 在当前类中自己使用自己的属性、实例方法
 如果想要解决这个问题有两种方法：
 一、使用__weak 关键字修饰，weakSelf 使用弱引用，也就表示self 也使用了弱引用修饰， 修饰后block 内部就不会对self持有，也就不会导致循环引用
 二、不使用self当前类来引用当前类中的属性或者实例变量，而是直接使当前类中的Block来引用当前类中的属性或者实例变量
 
 ***/

@interface BlockTest : NSObject



- (void)blockTest;


@end
