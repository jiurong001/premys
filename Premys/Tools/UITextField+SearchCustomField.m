//
//  UITextField+SearchCustomField.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/22.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "UITextField+SearchCustomField.h"

@implementation UITextField (SearchCustomField)


//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 0, 0);
    
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 0, 0);
}






@end
