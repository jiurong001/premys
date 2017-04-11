//
//  carServeViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/7.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "carServeViewController.h"

@interface carServeViewController ()

@end

@implementation carServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DLogMethod();

    self.title = [NSString stringWithFormat:@"type:%ld", self.carServeType];
    
    
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
