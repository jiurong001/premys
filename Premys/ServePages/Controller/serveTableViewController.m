//
//  serveTableViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/6.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "serveTableViewController.h"
#import "serveTableViewCell.h"
#import "carServeViewController.h"
#import "discountViewController.h"

#define serveTableViewCellID @"serveTableViewCellID"

@interface serveTableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *serveTableView;



@end

@implementation serveTableViewController


//1、设置导航栏 的 左右Item
- (void)setNaviItem{
    
    //左item
    UIButton *leftItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 95, 28)];
    [leftItem setImage:[UIImage imageNamed:@"serviceImage"] forState:UIControlStateNormal];
    [leftItem addTarget:self action:@selector(serviceAction) forControlEvents:UIControlEventTouchUpInside];
    [leftItem setTitle:@"正在维修" forState:UIControlStateNormal];
    leftItem.titleLabel.font = [UIFont systemFontOfSize:14];
    leftItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftItem.contentEdgeInsets = UIEdgeInsetsMake(-1, 0, 0, 0);
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftItem];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    //右item
    UIButton *rightItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 28)];
    [rightItem setImage:[UIImage imageNamed:@"nearbyImage"] forState:UIControlStateNormal];
    [rightItem addTarget:self action:@selector(nearbyAction) forControlEvents:UIControlEventTouchUpInside];
    [rightItem setTitle:@"附近" forState:UIControlStateNormal];
    rightItem.titleLabel.font = [UIFont systemFontOfSize:14];
    rightItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    //改变图片位置
    rightItem.contentEdgeInsets = UIEdgeInsetsMake(-1, 0, 0, 0);
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItem = rightBar;//
}

- (void)serviceAction{
    DLogMethod();
}

- (void)nearbyAction{
    DLogMethod();
}
//2、 设置tableView 的头视图  collectionView
- (UIView *)createHeaderViewWithImageNameArr:(NSArray *)nameArr titleArr:(NSArray *)titleArr{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SizeRatioScreenHeight(286.0))];
    view.backgroundColor = HEXColor(0xefeff4);
     for (int i = 0; i <  nameArr.count; i ++) {
         UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
         button.frame = CGRectMake(SizeRatioScreenWidth(25.0  + 122.5 * (i % 3 )) , SizeRatioScreenHeight(18.0  + 115.0 * (i % 2)), SizeRatioScreenWidth(80.0), SizeRatioScreenHeight(80.0));
         button.tag = 1000 + i;
         button.titleLabel.font = [UIFont systemFontOfSize:13];
         [button addTarget:self action:@selector(headerItemAction:) forControlEvents:UIControlEventTouchUpInside];
         //设置背景图
         [button setBackgroundImage:[UIImage imageNamed:nameArr[i]] forState:UIControlStateNormal];
         //设置title
         [button setTitle:titleArr[i] forState:UIControlStateNormal];
         [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
         [button setTitleEdgeInsets:UIEdgeInsetsMake(SizeRatioScreenHeight(80.0 + 20.0), 0, 0, 0)];
         [view addSubview:button];
    }
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"crossImage"]];
    [view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(view.mas_centerX);
        make.bottom.mas_equalTo(view.mas_bottom).with.offset(SizeRatioScreenWidth(- 10.0));
        make.width.equalTo([NSNumber numberWithFloat:SizeRatioScreenWidth(180.0)]);
        make.height.equalTo([NSNumber numberWithFloat:SizeRatioScreenWidth(27.0)]);
    }];
    return view;
}
- (void)headerItemAction:(UIButton *)button{
    DLogMethod();
    DLog(@"headerItem button tag  ------%ld", button.tag);
    carServeViewController *carServe = [[carServeViewController alloc] initWithNibName:@"carServeViewController" bundle:nil];
    carServe.carServeType = button.tag;
    [self.navigationController pushViewController:carServe animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、设置 item
    [self setNaviItem];
    //2、 设置tableView 的头视图
    NSArray *imageNameArr = @[@"washCarImage",@"beautyImage",@"maintenanceImage",@"tireImage",@"claimsImage",@"photoImage"];
    NSArray *titleNameArr = @[@"洗车",@"汽车美容",@"汽车保养",@"轮胎中心",@"保险理赔",@"拍照过户"];
    self.serveTableView.tableHeaderView = [self createHeaderViewWithImageNameArr:imageNameArr titleArr:titleNameArr];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    serveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:serveTableViewCellID];
    if (!cell) {
        cell = (serveTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"serveTableViewCell" owner:self options:nil]  lastObject];
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"store tableView cell   ---------%ld", (long)indexPath.row);

    discountViewController *discountVc= [[discountViewController alloc] initWithNibName:@"discountViewController" bundle:nil];
    [self.navigationController pushViewController:discountVc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = SizeRatioScreenHeight(210.0);
    return height;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
