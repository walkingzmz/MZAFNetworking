//
//  ListTableViewCell.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/8.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ListTableViewCell.h"
#import "Lists.h"
#import "usrinfo.h"
#import "ListModelFrame.h"
#import "UIImageView+WebCache.h"

#define LISTUNAMEFONT [UIFont systemFontOfSize:13]
#define LISTCONTENTFONT [UIFont systemFontOfSize:14]
#define LISTTIMEFONT [UIFont systemFontOfSize:12]
#define CellBorderW 12

@interface ListTableViewCell()

/**
 *  头像ImageView
 */
@property (nonatomic,strong) UIImageView *iconImageView;
/**
 *  昵称Lbale
 */
@property (nonatomic,strong) UILabel *unameLabel;
/**
 *  发布时间Label
 */
@property (nonatomic,strong) UILabel *addtimeLabel;
/**
 *  配图ImageView
 */
@property (nonatomic,strong) UIImageView *coverimgView;
/**
 *  内容Label
 */
@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation ListTableViewCell





-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self setupSubViews];
    }
    return  self;
}
#pragma makr - 初始化子控件
-(void)setupSubViews{
    
    //头像
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    
    //昵称
    self.unameLabel = [[UILabel alloc] init];
    self.unameLabel.textAlignment = NSTextAlignmentLeft;
    self.unameLabel.textColor = [UIColor colorWithRed:148 green:161 blue:255 alpha:1];
    //RGB(148, 161, 255);
    self.unameLabel.font = LISTUNAMEFONT;
    [self.contentView addSubview:self.unameLabel];
    
    //发布时间
    self.addtimeLabel = [[UILabel alloc] init];
    self.addtimeLabel.textAlignment = NSTextAlignmentRight;
    self.addtimeLabel.textColor = [UIColor lightGrayColor];
    self.addtimeLabel.font = LISTTIMEFONT;
    [self.contentView addSubview:self.addtimeLabel];
    
    //内容
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    self.contentLabel.textColor = [UIColor darkGrayColor];
    self.contentLabel.font = LISTCONTENTFONT;
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contentLabel];
    
    //配图(如果有的话)
    self.coverimgView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.coverimgView];
    
}


-(void)setListFrame:(ListModelFrame *)listFrame
{
    Lists *listM = listFrame.list;
    usrinfo *userinfoM = listM.userinfo;
   
    //设置各个子控件的frame
    //头像
    self.iconImageView.frame = listFrame.iconF;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:userinfoM.icon] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    self.iconImageView.layer.cornerRadius = 25;
    self.iconImageView.layer.masksToBounds = YES;
    
    //昵称
    self.unameLabel.frame = listFrame.unameF;
    self.unameLabel.text = userinfoM.uname;
    
    //发布时间
    self.addtimeLabel.frame = listFrame.addtimeF;
    self.addtimeLabel.text = listM.addtime_f;
    
    //配图
    if (listM.coverimg) {
        [self.coverimgView sd_setImageWithURL:[NSURL URLWithString:listM.coverimg] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        self.coverimgView.frame = listFrame.coverimgF;
        
        self.coverimgView.hidden  = NO;
    }else
    {
        self.coverimgView.hidden = YES;
    }

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
