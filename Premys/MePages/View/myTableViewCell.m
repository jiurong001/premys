//
//  myTableViewCell.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/5.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //背景阴影
    self.backgroundImageV.layer.shadowRadius = 3.0;
    self.backgroundImageV.layer.shadowColor  = [UIColor darkGrayColor].CGColor;
    self.backgroundImageV.layer.shadowOffset = CGSizeMake(0, 3);//设置成（0，0）代表不偏离默认是偏离（0，-3），x表示向下偏离的距离，y表示向右偏离的距离
    //透明度
    self.backgroundImageV.layer.shadowOpacity = 0.6;
    
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
