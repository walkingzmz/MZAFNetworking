//
//  Lists.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/9/30.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class usrinfo;
@interface Lists : NSObject

@property(nonatomic,strong)usrinfo *userinfo;
// 发布时间
@property(nonatomic,copy)NSString *addtime_f;
// 内容
@property(nonatomic,copy)NSString *content;
// 图片大小
@property(nonatomic,copy)NSString *coverimg_wh;
// 图片
@property(nonatomic,copy)NSString *coverimg;


@end

/*
 {
 addtime = 1475891701;
 "addtime_f" = "2\U5206\U949f\U524d";
 content = "\U8fd8\U6709\U4e0d\U523024\U5c0f\U65f6\U5c31\U8981\U8d70\U5566\Uff0c\U79bb\U5f00\U6709\U4f60\U7684\U57ce\U5e02\Uff0c\U51ac\U5929\U89c1\U4eb2\U7231\U7684\Uff0c\U6211\U4eec\U90fd\U8981\U597d\U597d\U7684";
 contentid = 57f851f501334d54539f3ea4;
 counterList =                 {
 comment = 0;
 like = 1;
 };
 coverimg = "http://pkimg.image.alimmdn.com/upload/20161008/45b9ff260e5d126d8fc067309d5350fc.png";
 "coverimg_wh" = "640*640";
 islike = 0;
 songid = "";
 "tag_info" =                 {
 count = 0;
 offical = 0;
 tag = "";
 };
 userinfo =                 {
 icon = "http://wx.qlogo.cn/mmopen/ibLButGMnqJMpibVTicpqq9VuxF5Xmcwg943IQtxHzcnzzpeH2Dj0cWQvTqcvdB8ss2j5JZTElnwOh4HTnyfGy2jT0IU1bg7dicV/0";
 uid = 3693812;
 uname = "Cherry yu \Ud83c\Udf523693812";
 };
 },

*/
