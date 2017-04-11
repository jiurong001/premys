//
//  SearchViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/22.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "SearchViewController.h"
#import "UITextField+SearchCustomField.h"

@interface SearchViewController ()
{
  
}


@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SearchViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:NO];
    
    
}

- (IBAction)searchAction:(UIButton *)sender {
    DLogMethod();
   
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    self.view.backgroundColor = HEXColor(0xf0eff4);
    
    self.searchTextField.backgroundColor = [UIColor whiteColor];
    self.searchTextField.tintColor = MainColoeValue;//光标颜色
    self.searchTextField.layer.cornerRadius = self.searchTextField.height/2;
    self.searchTextField.layer.masksToBounds = YES;

    
    
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
