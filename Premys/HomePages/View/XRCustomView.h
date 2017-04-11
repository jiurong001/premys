//
//  XRCustomView.h
//  Premys
//
//  Created by HCPGDN001 on 2017/3/21.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRCustomView : UIView

//@property (nonatomic, strong) NSArray *pageImageArr;


- (instancetype)initWithFrame:(CGRect)frame pageImageArr:(NSArray *)pageImageArr;
- (void)changeCurrentPageValue:(NSInteger)value;


@end
