//
//  ActivityDetailsViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/22.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "ActivityDetailsViewController.h"


@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    DLog(@"imageVNumber  ----%ld", self.imageVNumber);
    
    self.title = @"活动详情";
    
        
    // Do any additional setup after loading the view from its nib.
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
