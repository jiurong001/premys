//
//  XRCustomView.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/21.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "XRCustomView.h"

@interface XRCustomView ()


//椭圆形
@property (nonatomic, strong) UIImageView *longImageV;
@property (nonatomic, strong) UIImageView *littleImageV;
@property (nonatomic, strong) NSArray *pageArr;

@end


@implementation XRCustomView

//- (NSArray *)pageImageArr{
//    if (!_pageImageArr) {
//        _pageImageArr = [[NSArray alloc] init];
//    }
//    return _pageImageArr;
//}

- (UIImageView *)littleImageV{
    if (!_littleImageV) {
        _littleImageV = [[UIImageView alloc] init];
    }
    return _littleImageV;
}
- (UIImageView *)longImageV{
    if (!_longImageV) {
        _longImageV = [[UIImageView alloc] init];
    }
    return _longImageV;
}


- (instancetype)initWithFrame:(CGRect)frame pageImageArr:(NSArray *)pageImageArr{
    
//    DLog(@"viewPageType ---- %@", pageImageArr);
    self =  [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        for (int i = 0; i < 5; i ++) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i * 10, 0, 5, 5)];
            imageV.tag = i + 100;
            imageV.image = [UIImage imageNamed:pageImageArr[0]];
            [self addSubview:imageV];
        }
        UIImageView *imageVt = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 5)];
        imageVt.image = [UIImage imageNamed:pageImageArr[1]];
        imageVt.tag = 99;
        [self addSubview:imageVt];
    }
    return self;
}


- (void)changeCurrentPageValue:(NSInteger)value{
    

//    [UIView animateWithDuration:0.3 animations:^{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (UIImageView *imageV in self.subviews) {
            
            if (imageV.tag == 99) {
                
                imageV.x = value * 10;
//                DLog(@"value  --------------------%ld", value);
            }
        }
//    });
    
//    }];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
