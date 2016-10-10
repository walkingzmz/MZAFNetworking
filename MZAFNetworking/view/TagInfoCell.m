//
//  TagInfoCell.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/10.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "TagInfoCell.h"
#import "UIViewExt.h"
#import "NSString+Helper.h"
#import "UIImageView+WebCache.h"
#import "Taginfo.h"
@implementation TagInfoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    self.ennameLabel.frame = CGRectMake(12, 12, 200, 20);
    
    self.coverImageView.frame = CGRectMake(12, self.ennameLabel.bottom+12, [UIScreen mainScreen].bounds.size.width-24, 180);
    
    CGSize sizes =  [self.listModel.content sizeWithFont:[UIFont systemFontOfSize:13] maxW:[UIScreen mainScreen].bounds.size.width-24];
    self.contentLabel.frame = CGRectMake(12, self.coverImageView.bottom+12, sizes.width, sizes.height);
    
    self.tag_infoLabel.frame = CGRectMake(12, self.contentLabel.bottom+12, 300, 30);
    
    self.listModel.cellHeight = self.tag_infoLabel.bottom+30;
}

-(void)setListModel:(TwoLists *)listModel
{
    
    self.ennameLabel.text = [NSString stringWithFormat:@"%@·%@",listModel.name,listModel.enname];
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    self.contentLabel.text = listModel.content;
    self.tag_infoLabel.text = [NSString stringWithFormat:@"%@%ld",listModel.tag_info.tag,listModel.tag_info.count];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
