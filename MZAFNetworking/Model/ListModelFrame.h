//
//  ListModelFrame.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/8.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LISTUNAMEFONT [UIFont systemFontOfSize:13]
#define LISTCONTENTFONT [UIFont systemFontOfSize:14]
#define LISTTIMEFONT [UIFont systemFontOfSize:12]
#define CellBorderW 12
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

@class Lists;

@interface ListModelFrame : NSObject

@property(nonatomic,strong)Lists *list;
//头像
@property(nonatomic,assign)CGRect iconF;
//姓名
@property(nonatomic,assign)CGRect unameF;
//发布时间
@property(nonatomic,assign)CGRect addtimeF;
//内容
@property(nonatomic,assign)CGRect contentF;
//图片
@property(nonatomic,assign)CGRect coverimgF;
//cell的高度
@property(nonatomic,assign)CGFloat cellHeight;
@end
