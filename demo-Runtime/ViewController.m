//
//  ViewController.m
//  demo-Runtime
//
//  Created by 王义国 on 2020/4/18.
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
    Person *person = [[Person alloc]init];
//    [person sendMsg:@"say - hello!"];
    [person sendMsg2];
//    上面的代码等同于：
//    objc_msgSend(id _Nullable self, SEL _Nonnull op, ...)
//    第一个参数为id 为发送消息的对象，第二个为方法列表 后面...可传所需参数，如果多参数，可以逗号分开，继续传
//    person 为向谁发送消息，即为消息对象，第二个SEL为方法标号， 
//    objc_msgSend(person,@selector(sendMsg:),@"hello");
//    void (*yg_msgsend)(id, SEL, NSString *) = (void (*)(id, SEL, NSString *))objc_msgSend;
////  先定义原型才可以使用
//    yg_msgsend(person, @selector(sendMsg:), @"hello ");
}


@end
