//
//  ZmzRequest.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/9/30.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZmzAFNetworking.h"

typedef void (^sendData)(id ServersData, BOOL isSuccess);

@interface ZmzRequest : NSObject

//获取首页列表
- (void)getDateWithParams:(NSDictionary *)params WithDataBlock:(sendData)sendBlock;
//获取展示列表
-(void)getListDataBlock:(sendData)sendBlock;
@end
