//
//  usrinfo.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/8.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface usrinfo : NSObject
/**
 * 用户姓名 name
*/
@property(nonatomic,copy)NSString *uname;
/**
 * 用户userid
 */
@property(nonatomic,assign)NSInteger uid;

/**
 * 用户usericon
 */
@property(nonatomic,copy)NSString *icon;


@end
