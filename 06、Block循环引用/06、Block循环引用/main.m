//
//  main.m
//  06、Block循环引用
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        BlockTest *tens = [[BlockTest alloc]init];
        
        [tens blockTest];
        
    
    }
    return 0;
}
