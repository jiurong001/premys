//
//  myTableViewCell.h
//  Premys
//
//  Created by HCPGDN001 on 2017/4/5.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageV;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;

@end
