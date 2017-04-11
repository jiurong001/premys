//
//  HeaderFilea.h
//  Premys
//
//  Created by HCPGDN001 on 2017/3/17.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#ifndef HeaderFilea_h
#define HeaderFilea_h


#define kScreenWidth   [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define MainColoeValue [UIColor colorWithRed:236/255.0 green:99/255.0 blue:49/255.0 alpha:1.0]

#define HEXColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]




#endif /* HeaderFilea_h */
