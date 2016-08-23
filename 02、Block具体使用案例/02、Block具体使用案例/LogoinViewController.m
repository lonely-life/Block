//
//  ViewController.m
//  02、使用block处理值传递
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "LogoinViewController.h"
#import "RegistViewController.h"

@interface LogoinViewController ()

//这里是用拖拉的形式将登陆界面中用户名和密码的lable在这里形成属性，用来接收从注册界面传递过来的值
@property (weak, nonatomic) IBOutlet UITextField *userNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxf;

@end

@implementation LogoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    //用注册界面的类来创建一个注册界面的数值储存对象
    RegistViewController *registVC = segue.destinationViewController;
    
    //这种形式是直接赋值的形式
    NSString *userName = @"dddddd";
    NSString *password = @"111111";
    
    
    [registVC loadUserName:userName password:password];
    
    // 定义block, 接收调用时传入的参数
    registVC.userBlock = ^(NSString *userName, NSString *password) {
        
        self.userNameTxf.text = userName;
        self.passwordTxf.text = password;
    };
    

}


@end
