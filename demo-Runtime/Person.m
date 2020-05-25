//
//  Person.m
//  demo-Runtime
//
//  Created by Equal on 2020/4/18.
//  Copyright © 2020 小王同学. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
#import "Person2.h"

@implementation Person

-(void)sendMsg:(NSString *)words{
    NSLog(@"Person = i want to express - %@",words);
}

void sendMsg(id self, SEL _cmd, NSString *words){
    NSLog(@"====== %@",words);
}

#pragma mark - 动态方法解析
//类的动态方法
+(BOOL)resolveClassMethod:(SEL)sel{
    return NO;
}

//对象的的动态方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
//判断如果实现返回yes 否则返回NO，交给下一个处理机制去处理
//    1、匹配方法
    NSString *methodName = NSStringFromSelector(sel);
    if ([methodName isEqualToString:@"sendMsg:"]) {
        //实现方法
//        class_addMethod(Class _Nullable cls, SEL _Nonnull name, IMP _Nonnull imp,const char * _Nullable types)   第一个类 传self，第二个方法编号：sel
        return  class_addMethod(self, sel, (IMP)sendMsg, "v@:@");
    }
    return NO;
}

#pragma mark - 消息快速转发
//返回一个备用的接受者
-(id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMsg:"]) {
        return [Person2 new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 消息慢速转发
//方法签名
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMsg:"]) {
        //返回一个NSMethodSignature对象
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//NSInvocation继承树
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    //从继承树拿到这个方法
    SEL sel = [anInvocation selector];
    Person2 *person2 = [Person2 new];
    //判断替代对象是否包含该方法，如果包含，转移target，如果没有 继续走继承树
    if ([person2 respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:person2];
    }else{
        //如果没有 继续走季成书，再没有就报错抛异常了
        [super forwardInvocation:anInvocation];
    }
}

#pragma mark - 方法未实现的情况
-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"这个%@方法还没有实现呢",NSStringFromSelector(aSelector));
}

@end
