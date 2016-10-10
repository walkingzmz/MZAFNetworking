//
//  TwoLists.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/9.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Taginfo;
@interface TwoLists : NSObject
//属于哪个模块
@property(nonatomic,copy)NSString *name;
//内容
@property(nonatomic,copy)NSString *content;

//图片
@property(nonatomic,copy)NSString *coverimg;

//英文名字
@property(nonatomic,copy)NSString *enname;

// 标题
@property(nonatomic,copy)NSString *title;

//作者
@property(nonatomic,strong)Taginfo *tag_info;


@property(nonatomic,assign)CGFloat cellHeight;
/**
 *  歌曲序号
 */
@property (nonatomic,assign) NSUInteger songid;

@property (strong, nonatomic) NSString *contentid;

@end
/*
 {
 content = "\U4e00\U4f4dloser\U5927\U53d4\Uff0c\U628a\U4eba\U751f\U4e2d\U6700\U60b2\U50ac\U7684\U4e00\U5929\U91cd\U590d\U8fc7\U4e86\U4e0a\U5343\U904d\Uff0c\U5374\U610f\U5916\U6210\U4e3a\U4eba\U751f\U8d62\U5bb6\U3002";
 contentstatus = 1;
 coverimg = "http://pkimg.image.alimmdn.com/upload/20161008/5e0403b7092ba793064aead8cdc5360e.JPG";
 date = "";
 enname = Movie;
 id = 57f1b9e301334d56699f3ef4;
 islike = 0;
 issend = 1;
 like = 6;
 name = "\U5ba1\U7247\U5ba4";
 stick = "";
 title = "\U5982\U679c\U65f6\U95f4\U6c38\U8fdc\U505c\U5728\U4e86\U6628\U5929 |\U300a\U571f\U62e8\U9f20\U4e4b\U65e5\U300b";
 type = 6;
 userinfo =             {
 uid = 3668922;
 uname = "\U5b50\U6208";
 };
 view = 154;
 },

*/
