//
//  TwoLostTableViewCell.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/10.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "TwoLostTableViewCell.h"
#import "TwoLists.h"
@implementation TwoLostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




+ (NSString *)cellIdentifierForRow:(TwoLists *)listModel{
    
    if (listModel.tag_info){
        return @"TagInfoCell";
    }else {
        return @"TitleCell";
    }

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.ennameLabel = [[UILabel alloc]init];
        self.ennameLabel.backgroundColor = [UIColor whiteColor];
        self.ennameLabel.font = [UIFont systemFontOfSize:10];
        self.ennameLabel.textColor = [UIColor lightGrayColor];
        self.ennameLabel.numberOfLines = 0;
        [self.contentView addSubview:self.ennameLabel];
        
        self.coverImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.coverImageView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.backgroundColor = [UIColor whiteColor];
        self.contentLabel.textColor = [UIColor darkGrayColor];
        self.contentLabel.font = [UIFont systemFontOfSize:13];
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
        
        self.tag_infoLabel = [[UILabel alloc] init];
        self.tag_infoLabel.backgroundColor = [UIColor whiteColor];
        self.tag_infoLabel.font = [UIFont systemFontOfSize:10];
        self.tag_infoLabel.textColor = [UIColor lightGrayColor];
        self.tag_infoLabel.numberOfLines = 0;
        [self.contentView addSubview:self.tag_infoLabel];

    }
    return self;
}















@end
