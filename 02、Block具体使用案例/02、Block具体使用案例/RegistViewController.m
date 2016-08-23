//
//  RegistViewController.m
//  02、使用block处理值传递
//
//  Created by kinglinfu on 16/8/23.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

//通过拖拉的形式，将注册界面上的用户名和密码这两个lable拉倒这里，使其成为属性
@property (weak, nonatomic) IBOutlet UITextField *userNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxf;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//当我们输入好用户名和密码之后，点击注册就会执行这里的方法，并将用户名和密码数值也block的回调的值进行传递
- (IBAction)registAction:(UIButton *)sender {
    
    // 调用block(回调)，传入参数完成数据的通信
    self.userBlock(_userNameTxf.text, _passwordTxf.text);

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
