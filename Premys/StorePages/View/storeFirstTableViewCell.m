//
//  storeFirstTableViewCell.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/10.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "storeFirstTableViewCell.h"

@implementation storeFirstTableViewCell

//点击button 时间
- (IBAction)buttonAction:(UIButton *)sender {
    DLogMethod();
    DLog(@"click  store header item button  ---------%ld", sender.tag);
    

}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_button1 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button2 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button3 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button4 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button5 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button6 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button7 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    [_button8 setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(90), 0, 0, 0)];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
