//
//  editViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/5.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "editViewController.h"

@interface editViewController ()

@end

@implementation editViewController

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"信息修改";
    
    //设置编辑按钮
    UIBarButtonItem *ensureItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(backEditVc)];
    self.navigationItem.rightBarButtonItem = ensureItem;
    
    
    // Do any additional setup after loading the view from its nib.
}
- (void)backEditVc{
    DLogMethod();
    //确定返回
    [self.navigationController popViewControllerAnimated:YES];
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
