//
//  headerCollectionViewCell.h
//  Premys
//
//  Created by HCPGDN001 on 2017/4/1.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headerCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;


@end
