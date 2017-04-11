//
//  MainTabBarController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/17.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

   
    
    
    //tabar 问题颜色的设置
    self.tabBar.unselectedItemTintColor = [UIColor darkGrayColor];
    self.tabBar.tintColor = MainColoeValue;
    
    
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
