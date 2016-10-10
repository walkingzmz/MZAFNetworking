//
//  Taginfo.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/9.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Taginfo : NSObject
/**
 *  作者姓名
 */
@property (nonatomic,copy) NSString *tag;
/**
 *  转载数量
 */
@property (nonatomic,assign) NSUInteger count;

@end
