//
//  ParentViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/1.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "ParentViewController.h"

@interface ParentViewController ()

@end

@implementation ParentViewController



#pragma mark -----自定义返回按钮样式, 次样式多次使用需要，写子类
-(void)resetBackBarItemImageView{
    DLogMethod();
    UIButton *itemButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [itemButton setImage:[UIImage imageNamed:@"naviBackImage"] forState:UIControlStateNormal];
    [itemButton addTarget:self action:@selector(backToPreviousViewController) forControlEvents:UIControlEventTouchUpInside];
    itemButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    itemButton.contentEdgeInsets = UIEdgeInsetsMake(-1, 0, 0, 0);
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    self.navigationItem.leftBarButtonItem = barButton;
}

- (void)backToPreviousViewController{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义返回按钮的 图标
    [self resetBackBarItemImageView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
