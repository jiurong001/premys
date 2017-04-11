//
//  storeTableViewController.m
//  Premys
//
//  Created by HCPGDN001 on 2017/4/6.
//  Copyright © 2017年 HCPGDN001. All rights reserved.
//

#import "storeTableViewController.h"
#import "XRCarouselView.h"
#import "storeFirstTableViewCell.h"
#import "storeSportTableViewCell.h"
#import "storeCarTableViewCell.h"


#define storeSportTableViewCellID @"storeSportTableViewCellID"
#define storeFirstTableViewCellID @"storeFirstTableViewCellID"

#define HeaderCarouseHeight SizeRatioScreenHeight(165.0)
#define HeaderButtonHeight  SizeRatioScreenHeight(43.0)
#define FirstCellHeight     SizeRatioScreenHeight(270.0)

@interface storeTableViewController ()<UITextFieldDelegate>
{
    UIButton *buttonLeft;
    UIButton *buttonRight;
}

@property (nonatomic,strong) XRCarouselView *carouseView;
@property (strong, nonatomic) IBOutlet UITableView *storeTableView;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@property (nonatomic,strong) NSMutableArray *tableViewData;
@property (nonatomic, assign) BOOL tableType;


@end

@implementation storeTableViewController


- (NSArray *)tableViewData{
    if (!_tableViewData) {
        _tableViewData = [[NSMutableArray alloc] initWithCapacity:0];
        _tableViewData = [@[@"000", @"001",@"002", @"003", @"0004",@"005",@"006",@"007"] mutableCopy];
    }
    return _tableViewData;
}
//创建头视图
- (UIView *)createHeaderViewWithHeight:(CGFloat)height{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, height)];
    
    //1、 头视图为轮播图
    _carouseView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, HeaderCarouseHeight) pageImageArr:@[@"Image_Carous_d",@"Image_Carous_c"]];
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
    //用block处理图片点击事件
    _carouseView.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片", index);
    };
    [view addSubview:_carouseView];
    
    buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLeft.frame = CGRectMake(0, HeaderCarouseHeight, kScreenWidth/2 - 0.5, HeaderButtonHeight);
    buttonLeft.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [buttonLeft setTitle:@"体育用品" forState:UIControlStateNormal];
    [buttonLeft setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [buttonLeft setTitleColor:MainColoeValue forState:UIControlStateSelected];
    [buttonLeft setTitleColor:MainColoeValue forState:UIControlStateHighlighted];
    [buttonLeft addTarget:self action:@selector(headerButton:) forControlEvents:UIControlEventTouchUpInside];
    buttonLeft.tag = 1001;
    buttonLeft.selected = YES;
    [view addSubview:buttonLeft];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth/2-0.5,  HeaderCarouseHeight, SizeRatioScreenWidth(1.0), HeaderButtonHeight)];
    line.backgroundColor = HEXColor(0xefeff4);
    [view addSubview:line];
    
    buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setTitle:@"汽车用品" forState:UIControlStateNormal];
    buttonRight.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [buttonRight setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [buttonRight setTitleColor:MainColoeValue forState:UIControlStateSelected];
    [buttonRight setTitleColor:MainColoeValue forState:UIControlStateHighlighted];

    buttonRight.frame = CGRectMake(kScreenWidth/2 + 0.5, HeaderCarouseHeight, kScreenWidth/2 - 0.5, HeaderButtonHeight);
    [buttonRight addTarget:self action:@selector(headerButton:) forControlEvents:UIControlEventTouchUpInside];
    buttonRight.tag = 1002;
    [view addSubview:buttonRight];
    
    return view;
}

- (void)headerButton:(UIButton *)button{
    DLogMethod();
   
    if (button.tag == 1001) {
        buttonLeft.selected = YES;
        buttonRight.selected = NO;
        _tableViewData = [@[@"000", @"001",@"002", @"003", @"0004",@"005",@"006",@"007"] mutableCopy];
        _tableType = NO;
    }else{
        buttonLeft.selected = NO;
        buttonRight.selected = YES;
        _tableViewData = [@[@"000", @"001",@"002", @"003", @"0004",@"005"] mutableCopy];
        _tableType = YES;
    }
    
    [self.tableView reloadData];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)searchItem:(UIBarButtonItem *)sender {
    DLogMethod();
    [self.searchField resignFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

   //1、设置 搜索框 属性
    self.searchField.delegate = self;
    self.searchField.tintColor = [UIColor orangeColor];
    //2、记录tableView 类型
    _tableType = NO;
    
    self.storeTableView.tableHeaderView = [self createHeaderViewWithHeight:HeaderButtonHeight + HeaderCarouseHeight];
    

    //view sadklfjdsalkflklksadfadsfadsasdfadsfasdffdsdassadfasdfas
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.tableViewData.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        //storeFirstTableViewCellID
        storeFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:storeFirstTableViewCellID];
        if (!cell) {
            cell = (storeFirstTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"storeFirstTableViewCell" owner:self options:nil]  lastObject];
        }
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //默认tableView
        if (_tableType == NO) {
            
            
            [cell.button1 setTitle:@"健身器材" forState:0];
            [cell.button2 setTitle:@"康复器材" forState:0];
            [cell.button3 setTitle:@"球类" forState:0];
            [cell.button4 setTitle:@"运动护具" forState:0];
            [cell.button5 setTitle:@"户外用品" forState:0];
            [cell.button6 setTitle:@"运动衣类" forState:0];
            [cell.button7 setTitle:@"野外宿营" forState:0];
            [cell.button8 setTitle:@"其它用品" forState:0];
            

            cell.button7.hidden = NO;
            cell.button8.hidden = NO;
        }else{
            
            [cell.button1 setTitle:@"机油" forState:0];
            [cell.button2 setTitle:@"座椅" forState:0];
            [cell.button3 setTitle:@"轮胎轮廓" forState:0];
            [cell.button4 setTitle:@"汽车音响" forState:0];
            [cell.button5 setTitle:@"汽车挂件" forState:0];
            [cell.button6 setTitle:@"贴膜" forState:0];
//            [cell.button7 setTitle:@"健身器材" forState:0];
//            [cell.button8 setTitle:@"健身器材" forState:0];
//            [cell.button1 setBackgroundImage:[UIImage imageNamed:@"leftItemImage"] forState:0];

            cell.button7.hidden = YES;
            cell.button8.hidden = YES;
        }
        
        
        return cell;
    }else{
        
        if (_tableType == NO) {
            storeSportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:storeSportTableViewCellID];
            if (!cell) {
                cell = (storeSportTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"storeSportTableViewCell" owner:self options:nil]  lastObject];
            }
            
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
             cell.testLabel.text = [NSString stringWithFormat:@"left--%@；撒地方就奥斯卡代理费卢卡斯发技术等法律框架阿萨德六块腹肌爱丽丝阿萨德是打发似的了房间里看见了发送到卡解放路卡三等奖开了房间拉克丝", self.tableViewData[indexPath.row - 1]];
            
            
            return cell;
        }else{
            storeCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:storeSportTableViewCellID];
            if (!cell) {
                cell = (storeCarTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"storeCarTableViewCell" owner:self options:nil]  lastObject];
            }
            
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.testLabel.text = [NSString stringWithFormat:@"right--%@；福利卡山东福利卡上的经历来看阿萨德范德萨发生的发送到发多少快放假了卡士大夫卢卡斯发的所发发商代理客服经理房间里卡束带结发阿斯顿发送到", self.tableViewData[indexPath.row - 1]];
            
            return cell;
        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"store tableView cell   ------------------%ld", (long)indexPath.row-1);

    [self.searchField resignFirstResponder];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.row == 0) {
        return SizeRatioScreenHeight(270.0);
    }
    if (_tableType == NO) {
        //iPhone 5 尺寸
//        return SizeRatioScreenHeight(222.0);
        return SizeRatioScreenHeight(200.0);
    }else{
        return SizeRatioScreenHeight(170.0);;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
