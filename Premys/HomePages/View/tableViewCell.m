//
//  TableViewCell.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/1.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "tableViewCell.h"

@interface UITableViewCell ()

@end

@implementation tableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    DLog(@"cell imageV  bounds width-----%f", (SizeRatioScreenHeight(157.0) - 32.0*2) / 2);
    self.imageV.layer.cornerRadius  = (SizeRatioScreenHeight(157.0) - 32.0*2) / 2;
    self.imageV.layer.masksToBounds = YES;
   
    // 为图片添加边框,根据需要设置边框
    self.imageV.layer.borderWidth = 1.0;//边框的宽度
    self.imageV.layer.borderColor = [UIColor redColor].CGColor;//边框的颜色
    //背景阴影
    self.backgroundImageV.layer.shadowRadius = 3.0;
    self.backgroundImageV.layer.shadowColor  = [UIColor lightGrayColor].CGColor;
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
