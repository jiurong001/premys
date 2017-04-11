//
//  TableViewCell.h
//  Premys
//
//  Created by HCPGDN001 on 2017/4/1.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageV;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//star imageView
@property (weak, nonatomic) IBOutlet UIImageView *starImageV1;
@property (weak, nonatomic) IBOutlet UIImageView *starImageV2;
@property (weak, nonatomic) IBOutlet UIImageView *starImageV3;
@property (weak, nonatomic) IBOutlet UIImageView *starImageV4;
@property (weak, nonatomic) IBOutlet UIImageView *starImageV5;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tadayLabel;


@end
