//
//  ViewController.m
//  demo-Runtime
//
//  Created by Equal on 2020/4/18.
//  Copyright © 2020 小王同学. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <Messages/Messages.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    Person *person = [[Person alloc]init];
//    [person sendMsg:@"say - hello!"];
//    上面的代ngxi码等同于：
//    objc_msgSend(id _Nullable self, SEL _Nonnull op, ...)
//    第一个参数为id 为发送消息的对象，第二个为方法列表 后面...可传所需参数，如果多参数，可以逗号分开，继续传
//    person 为向谁发送消息，即为消息对象，第二个SEL为方法标号，
//    objc_msgSend(person,@selector(sendMsg:),@"hello");
//    void (*yg_msgsend)(id, SEL, NSString *) = (void (*)(id, SEL, NSString *))objc_msgSend;
////  先定义原型才可以使用
////    yg_msgsend(person, @selector(sendMsg:), @"hello ");
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(200, 200, 50, 50);
//    [button setTitle:@"login" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"1");
//    });
//
//    NSLog(@"2");
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0);
//
//    dispatch_sync(queue, ^{
//        NSLog(@"3");
//    });
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"4");
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"5");
//    });
//
//    NSLog(@"6");
//
//    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:0];
//
//    NSLog(@"8");
    
    
    NSString *str = nil;
    NSLog(@"==  %@",str.capitalizedString);
}

- (void)delayMethod{
    NSLog(@"7");
}

////可以注释掉测试下代码
//-(void)login:(UIButton *)button{
//    NSLog(@"我实现了哈哈哈哈哈！！！！！");
//}

//-(void)login{
//    NSLog(@"wo login!!");
//}

@end
