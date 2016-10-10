//
//  ListModelFrame.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/8.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ListModelFrame.h"
#import "Lists.h"
#import "usrinfo.h"
#import "NSString+Helper.h"
#import "UIView+Frame.h"
#import "CoverimgTool.h"
@implementation ListModelFrame

-(void)setList:(Lists *)list
{
    _list = list;
    
    usrinfo *user = list.userinfo;
    
    //重写setter方法计算cell里面内容的高度
    //头像
    self.iconF = CGRectMake(CellBorderW, CellBorderW, 50, 50);
    //姓名
    CGSize unameSize = [user.uname sizeWithFont:LISTUNAMEFONT];
    CGFloat yy = (50 / 2 + CellBorderW) - unameSize.height / 2;
    self.unameF = CGRectMake(61+CellBorderW, yy, unameSize.width,unameSize.height);
    
    //更新时间
    CGSize addtimesize = [list.addtime_f sizeWithFont:LISTTIMEFONT];
    self.addtimeF = CGRectMake([UIScreen mainScreen].bounds.size.width-100, yy, addtimesize.width, addtimesize.height);
    
    
    CGFloat contentY = 0;
    CGFloat coverW = SCREENWIDTH - 2 * CellBorderW;

    // 图片
    if (list.coverimg.length) {
        
        CGFloat coverX = CellBorderW;
        CGFloat coverY = CGRectGetMaxY(self.iconF) + CellBorderW;
        CGFloat coverScale = [CoverimgTool sizeWithSizeString:list.coverimg_wh];
        
        self.coverimgF = CGRectMake(coverX, coverY, coverW, coverW * coverScale);
        
        contentY = CGRectGetMaxY(self.coverimgF)+CellBorderW;
        
    }else{
        
        contentY = CGRectGetMaxY(self.iconF)+CellBorderW;
    }
    
    //内容
    CGSize conSize = [list.content sizeWithFont:LISTCONTENTFONT maxW:coverW];
    
    self.contentF = CGRectMake(CellBorderW, contentY, conSize.width, conSize.height);
    
    
    self.cellHeight = CGRectGetMaxY(self.contentF)+ 2*CellBorderW;
    
}

@end
