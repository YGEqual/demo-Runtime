//
//  Person.h
//  demo-Runtime
//
//  Created by 王义国 on 2020/4/18.
//  Copyright © 2020 小王同学. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
-(void)sendMsg:(NSString *)words;

-(void)sendMsg2;
@end

NS_ASSUME_NONNULL_END
