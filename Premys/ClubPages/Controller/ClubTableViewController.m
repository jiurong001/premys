//
//  ClubTableViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/22.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "ClubTableViewController.h"
#import "clubTableViewCell.h"
#import "clubDetailViewController.h"
#import "clubHeaderTableViewCell.h"

#define clubTableViewCellID @"clubTableViewCellID"
#define clubHeaderTableViewCellID @"clubHeaderTableViewCellID"


@interface ClubTableViewController ()


@property (strong, nonatomic) IBOutlet UITableView *clubTableView;
@property (strong, nonatomic) UITableView *clubHeaderTableView;

@end

@implementation ClubTableViewController


- (UITableView *)clubHeaderTableView{
    if (!_clubHeaderTableView) {
        
    }
    return _clubHeaderTableView;
}

//创建 右 Item
- (void)createNaviRightItem{
    //右item
    UIButton *rightItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    [rightItem setImage:[UIImage imageNamed:@"rightItemImage"] forState:UIControlStateNormal];
    [rightItem addTarget:self action:@selector(unfoldMood) forControlEvents:UIControlEventTouchUpInside];
    rightItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightItem.contentEdgeInsets = UIEdgeInsetsMake(-1, 0, 0, 0);
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItem = rightBar ;
}

//创建头视图
- (UIView *)createTableViewHeaderViewWithHeight:(CGFloat)height{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SizeRatioScreenHeight(height))];
    self.clubHeaderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, height) style:UITableViewStylePlain];
    self.clubHeaderTableView.tag        = 1001;
    self.clubHeaderTableView.delegate   = self;
    self.clubHeaderTableView.dataSource = self;
    [view addSubview:self.clubHeaderTableView];
    
    return view;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建 右 Item
    [self createNaviRightItem];
    


    
//    [self.clubTableView setContentInset:UIEdgeInsetsMake(SizeRatioScreenHeight(220.0), 0, 0, 0)];
    
   
}
//点击右item 的方法
- (void)unfoldMood {
    DLogMethod();
    
    //1、左item
    UIButton *leftItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    [leftItem setImage:[UIImage imageNamed:@"leftItemImage"] forState:UIControlStateNormal];
    [leftItem addTarget:self action:@selector(seeActivityKnowledge) forControlEvents:UIControlEventTouchUpInside];
    leftItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftItem.contentEdgeInsets = UIEdgeInsetsMake(-1, 0, 0, 0);
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftItem];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    //2、clubTableView指定头视图 tableView
    self.clubTableView.tableHeaderView = [self createTableViewHeaderViewWithHeight:SizeRatioScreenHeight(450.0)];
    
}

- (void)seeActivityKnowledge{
    DLogMethod();
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1001) {
        return 10;
    }
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSString *className = NSStringFromClass([self.clubHeaderTableView class]);
//    DLog(@"className --------%@", className);
    if (tableView.tag == 1001) {
        
        clubHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clubHeaderTableViewCellID];
        if (!cell) {
            cell = (clubHeaderTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"clubHeaderTableViewCell" owner:self options:nil]  lastObject];
        }
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        cell.testLabel.text = [NSString stringWithFormat:@"headerView   testlabel  ------%ld", (long)indexPath.row];
        return cell;
    }else{
        
        clubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clubTableViewCellID];
        if (!cell) {
            cell = (clubTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"clubTableViewCell" owner:self options:nil]  lastObject];
        }
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.testLabel.text = [NSString stringWithFormat:@"testlabel  ------%ld", (long)indexPath.row];
        return cell;
    }
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"club tableView cell   ---------%ld", (long)indexPath.row);
    
    clubDetailViewController *clubDetailVc =[[clubDetailViewController  alloc] initWithNibName:@"clubDetailViewController" bundle:nil];
    [self.navigationController pushViewController:clubDetailVc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = SizeRatioScreenHeight(50.0);
    return height;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //左item置空
    self.navigationItem.leftBarButtonItem = nil;
    self.clubTableView.tableHeaderView    = nil;
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
