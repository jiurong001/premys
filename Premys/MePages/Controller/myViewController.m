//
//  myViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/5.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "myViewController.h"
#import "myTableViewCell.h"
#import "editViewController.h"

#define myTableViewCellID @"myTableViewCellID"

@interface myViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *detaile;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *tableViewCellDataArr;

@end

@implementation myViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SizeRatioScreenHeight(185.0), kScreenWidth, kScreenHeight - SizeRatioScreenHeight(185.0 - 61.0 -49.0 -64.0)) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        //禁止滑动
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}

- (NSArray *)tableViewCellDataArr{
    if (!_tableViewCellDataArr) {
        _tableViewCellDataArr = [[NSArray alloc] initWithObjects:@"我的爱车 MY CARSR",@"我的钱包 MY WALLET",@"我的相册 MY ALBUMS",@"全部订单 MY REDER",@"购物车 MY SHOPPING CART", @"我的收藏 MY FAVORITE", nil];
    }
    return _tableViewCellDataArr;
}

- (void)setHeaderView{
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholderImage"]];

    imageV.backgroundColor = [UIColor redColor];
    imageV.layer.cornerRadius = (kScreenWidth - SizeRatioScreenHeight(142.0)*2) /2;
    imageV.layer.masksToBounds = YES;
    [self.view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(self.view.mas_top).with.offset(SizeRatioScreenHeight(23.0));
        make.left.mas_equalTo(self.view.mas_left).with.offset(SizeRatioScreenHeight(142.0));
        make.right.mas_equalTo(self.view.mas_right).with.offset(-SizeRatioScreenHeight( 142.0));
        make.height.equalTo([NSNumber numberWithInteger:(kScreenWidth - SizeRatioScreenHeight(142.0)*2)]);
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"静水流年";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:15.0];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(imageV.mas_bottom).with.offset(SizeRatioScreenHeight(8.0));
        make.left.mas_equalTo(self.view.mas_left).with.offset(SizeRatioScreenHeight(20.0));
        make.right.mas_equalTo(self.view.mas_right).with.offset(-SizeRatioScreenHeight(20.0));
        make.height.equalTo([NSNumber numberWithInteger:SizeRatioScreenHeight(17.0)]);
    }];
   
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.text = @"美好时光即可开始新的一天九分裤大师傅看了商店里卡积分卡拉斯加";
    detailLabel.textColor = [UIColor whiteColor];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(SizeRatioScreenHeight(6.0));
        make.left.mas_equalTo(self.view.mas_left).with.offset(SizeRatioScreenHeight(20.0));
        make.right.mas_equalTo(self.view.mas_right).with.offset(-SizeRatioScreenHeight(20.0));
        make.height.equalTo([NSNumber numberWithInteger:SizeRatioScreenHeight(17.0)]);
    }];
}


- (void)createSubButton{
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    myTableViewCell *cell = (myTableViewCell *)[tableView dequeueReusableCellWithIdentifier:myTableViewCellID];
    if (!cell) {
        cell= (myTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"myTableViewCell" owner:self options:nil]  lastObject];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"myCellImage%ld", (long)indexPath.row]];
    cell.titleLabel.text = self.tableViewCellDataArr[indexPath.row];
//    cell.detailTextLabel.text = @"MY WALLET";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = SizeRatioScreenHeight(50.0);
//    DLog(@"tableView cell height  -------%f", height);
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLogMethod();
    DLog(@"my tableView cell   ---------%ld", (long)indexPath.row);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建头视图
    [self setHeaderView];
    //创建 tableView
    [self.view addSubview:self.tableView];
    
    //设置编辑按钮
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"editImage"] style:UIBarButtonItemStylePlain target:self action:@selector(jumpEditVc)];
    self.navigationItem.rightBarButtonItem = editItem;
    
    
    // Do any additional setup after loading the view.
}
- (void)jumpEditVc{
    DLogMethod();
    
    editViewController *editVc = [[editViewController alloc] initWithNibName:@"editViewController" bundle:nil];
        [self.navigationController pushViewController:editVc animated:YES];
    
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
