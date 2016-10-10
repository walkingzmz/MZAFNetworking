//
//  TitleCell.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/10.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "TitleCell.h"
#import "NSString+Helper.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
//#import "Taginfo.h"
@implementation TitleCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
          [self setup];
    }
    return self;
}
-(void)setup{
    
    self.ennameLabel.frame = CGRectMake(12, 12, 200, 20);
    
    self.coverImageView.frame = CGRectMake(12, self.ennameLabel.bottom+12, [UIScreen mainScreen].bounds.size.width-24, 180);
    
    
    self.titleLabel.frame = CGRectMake(12, self.coverImageView.bottom+12, 355, 40);
    
    
   // CGSize sizes =  [self.listModel.content sizeWithFont:[UIFont systemFontOfSize:13] maxW:[UIScreen mainScreen].bounds.size.width-24];
   // NSLog(@"%lf===00====%lf==%@",sizes.height,sizes.width,self.listModel.content);
  //  self.contentLabel.frame = CGRectMake(12, self.titleLabel.bottom+12, [UIScreen mainScreen].bounds.size.width-24, 100);

   // NSLog(@"%lf--11---%lf",self.contentLabel.bottom,CGRectGetMaxY(<#CGRect rect#>));
}
\
-(void)setListModel:(TwoLists *)listModel
{
    self.ennameLabel.text = [NSString stringWithFormat:@"%@·%@",listModel.name,listModel.enname];
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    self.titleLabel.text = listModel.title;
    self.contentLabel.text = listModel.content;
    
   // NSLog(@"%@====--==%@",listModel.title,listModel.content);
  
    CGSize sizes =  [listModel.content sizeWithFont:[UIFont systemFontOfSize:13] maxW:[UIScreen mainScreen].bounds.size.width-24];
     NSLog(@"%lf===00====%lf==%@",sizes.height,sizes.width,listModel.content);
    self.contentLabel.frame = CGRectMake(12, self.titleLabel.bottom+12, sizes.width, sizes.height);

    listModel.cellHeight = self.contentLabel.bottom+30;
    NSLog(@"-------%lf",self.contentLabel.bottom);
}

@end
