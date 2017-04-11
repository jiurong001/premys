//
//  HomeTableViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/3/17.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "HomeTableViewController.h"
#import "XRCarouselView.h"
#import "headerCollectionViewCell.h"
#import "tableViewCell.h"

#define collectionCellID @"collectionCellID"
#define tableViewCellID  @"tableCellID"


@interface HomeTableViewController ()< UITableViewDataSource, UITableViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) XRCarouselView *carouseView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *headerView;



@end

@implementation HomeTableViewController



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_carouseView) {
        [_carouseView startTimer];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    DLogMethod();
    //指定tableView头视图
    [self setTableViewHeaderView];
    
}

// 头视图的创建
- (void)setTableViewHeaderView{
    //0、初始化透视图 指定给tableView
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SizeRatioScreenHeight(587.0))];
    self.tableView.tableHeaderView = self.headerView;
    
    //1、 头视图为轮播图
    _carouseView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SizeRatioScreenHeight(200.0)) pageImageArr:@[@"Image_Carous_d",@"Image_Carous_c"]];
    // 轮播图设置数据
    NSArray *arrData = @[
                         [UIImage imageNamed:@"03"],//网络图片
                         [UIImage imageNamed:@"01.jpg"],//本地图片，传image，不能传名称
                         [UIImage imageNamed:@"04"],//网络gif图片
                         gifImageNamed(@"02.gif"),//本地gif使用gifImageNamed(name)函数创建
                         [UIImage imageNamed:@"01.jpg"]
                         ];
    _carouseView.imageArray = arrData;
    //设置分页控件指示器的颜色 、、隐藏已有的圆点
    [_carouseView setPageColor:[UIColor clearColor] andCurrentPageColor:[UIColor clearColor]];
    //占位符图片
    //    _carouseView.placeholderImage = [UIImage imageNamed:@"placeholderImage.jpg"];
    //设置图片切换的方式
    _carouseView.changeMode = ChangeModeDefault;
    
    //设置轮播时间
    _carouseView.time = 0.3;
    __block typeof(self) blockSelf = self;
    //用block处理图片点击事件
    _carouseView.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片", index);
        blockSelf.activityDetailsVc = [[ActivityDetailsViewController alloc] initWithNibName:@"ActivityDetailsViewController" bundle:nil];
        blockSelf.activityDetailsVc.imageVNumber = index;
        //        blockSelf.hidesBottomBarWhenPushed = YES;
        [blockSelf.navigationController pushViewController:blockSelf.activityDetailsVc animated:YES];
    };
    [self.headerView addSubview:_carouseView];
    
    //2、 hotImageV
    UIImageView *hotNewsImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hotNewsImage"]];
    hotNewsImageV.frame = CGRectMake(SizeRatioScreenWidth(23.0), SizeRatioScreenHeight(10.0 + 200.0) , kScreenWidth - SizeRatioScreenWidth(23.0) * 2, SizeRatioScreenHeight(40.0));
    [self.headerView addSubview:hotNewsImageV];
    
    //3、水平滑动 collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SizeRatioScreenHeight(200.0 + 10.0 + 40.0 + 2.0), kScreenWidth, SizeRatioScreenHeight(260.0)) collectionViewLayout:layout];
    self.collectionView.backgroundColor = HEXColor(0xefeff4);
    self.collectionView.showsHorizontalScrollIndicator = NO;//水平的滑动条 关闭
    self.collectionView.delegate   = self;
    self.collectionView.dataSource = self;
    [self.headerView addSubview:self.collectionView];
    // 设置collection
    [self.collectionView registerNib:[UINib nibWithNibName:@"headerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionCellID];
    //4、行业动态
    UIImageView *tradeImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tradeNewsImage"]];

    [self.headerView addSubview:tradeImageV];
    [tradeImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.headerView.mas_left).with.offset(SizeRatioScreenWidth(98.0));
        make.right.mas_equalTo(self.headerView.mas_right).with.offset(- SizeRatioScreenWidth(98.0));
        make.top.mas_equalTo(self.collectionView.mas_bottom).with.offset(SizeRatioScreenHeight(35.0));
        make.bottom.mas_equalTo(self.headerView.mas_bottom).with.offset(- SizeRatioScreenHeight(13.0));
    }];
    //5、 more Button
    UIButton *moreBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBt setImage:[UIImage imageNamed:@"moreBtImage"] forState:UIControlStateNormal];
    [moreBt addTarget:self action:@selector(moreBtAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:moreBt];
    [moreBt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(tradeImageV.mas_right).with.offset(SizeRatioScreenWidth(40.0));
        make.right.mas_equalTo(self.headerView.mas_right).with.offset(- SizeRatioScreenWidth(16.0));
        make.centerY.mas_equalTo(tradeImageV.mas_centerY);
        make.height.mas_equalTo(tradeImageV.height).multipliedBy(1);
    }];
}

- (void)moreBtAction{
    DLogMethod();
}
#pragma mark ---collectionView----
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SizeRatioScreenWidth(143.0), SizeRatioScreenHeight(260.0));
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    headerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    if (!cell) {
        cell = (headerCollectionViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"headerCollectionViewCell" owner:self options:nil]  lastObject];
    }
    cell.nameLabel.text = @"name001";
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"home collection cell -------%ld", indexPath.row);
    
    
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //防止出现  图片位置错误
    [_carouseView stopTimer];
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
    
    tableViewCell *cell = (tableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    if (!cell) {
        cell = (tableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"tableViewCell" owner:self options:nil]  lastObject];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = SizeRatioScreenHeight(157.0);
//    DLog(@"tableView cell height  -------%f", height);
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"home tableView cell   ---------%ld", (long)indexPath.row);
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
