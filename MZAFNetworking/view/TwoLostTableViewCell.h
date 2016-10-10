//
//  TwoLostTableViewCell.h
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/10.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoLists.h"

@interface TwoLostTableViewCell : UITableViewCell

/**
 *  最上面Label，显示模块
 */
@property (nonatomic,strong) UILabel *ennameLabel;
/**
 *  配图(如果有的话)
 */
@property (nonatomic,strong) UIImageView *coverImageView;
/**
 *  音乐播放视图(如果有的话)
 */
//@property (nonatomic,strong) MusicView *musicView;
/**
 *  标题Label(如果有的话)
 */
@property (nonatomic,strong) UILabel *titleLabel;
/**
 *  内容简介Label
 */
@property (nonatomic,strong) UILabel *contentLabel;
/**
 *  作者详情Lable(如果有的话)
 */
@property (nonatomic,strong) UILabel *tag_infoLabel;

/**
 *  数据模型
 */
@property (nonatomic,strong) TwoLists *listModel;

+ (NSString *)cellIdentifierForRow:(TwoLists *)listModel;


@end
