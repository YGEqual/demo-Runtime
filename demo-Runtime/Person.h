//
//  Person.h
//  demo-Runtime
//
//  Created by Equal on 2020/4/18.
//  Copyright © 2020 小王同学. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
-(void)sendMsg:(NSString *)words;

+(void)sendMsg2;//类方法未实现就凉凉了
@end

NS_ASSUME_NONNULL_END
