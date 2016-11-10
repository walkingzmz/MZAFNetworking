//
//  TwoViewController.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/10/8.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "TwoViewController.h"
#import "ZmzRequest.h"
#import "SDCycleScrollView.h"
#import "MJExtension.h"
#import "TwoLists.h"
#import "TwoLostTableViewCell.h"
@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    SDCycleScrollView *cycleScrollView2;
}
@property(nonatomic,strong)UITableView *tablevview;

@property(nonatomic,strong)NSArray *listArr;


@end

@implementation TwoViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ZmzRequest *request = [[ZmzRequest alloc]init];
    
    [request getListDataBlock:^(id ServersData, BOOL isSuccess) {
        
        if (isSuccess) {
            
            
            
            NSDictionary *dicData = [ServersData objectForKey:@"data"];
            
            NSMutableArray *marr = [NSMutableArray array];
            NSArray *imarr = [dicData objectForKey:@"carousel"];
            
            for (NSDictionary *dic in imarr) {
                [marr addObject:[dic objectForKey:@"img"]];
            }
            
            
            self.imageArr = [marr mutableCopy];
            cycleScrollView2.imageURLStringsGroup = self.imageArr;
            self.listArr = [TwoLists mj_objectArrayWithKeyValuesArray:[dicData objectForKey:@"list"]];
            [self.tablevview reloadData];
            
            
        }
    }];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"展示";
   
    
   // NSLog(@"%@----%@",self.listArr,self.codic);
    [self loadViews];
    
}

-(void)loadViews{
    
    self.tablevview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tablevview.delegate = self;
    self.tablevview.dataSource = self;
    [self.view addSubview:self.tablevview];
    
    // 网络加载 --- 创建带标题的图片轮播器
    cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150) delegate:self placeholderImage:[UIImage imageNamed:@"image0"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //cycleScrollView2.titlesGroup = self.imageArr;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
   
    //         --- 模拟加载延迟
   // dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
   // });
    
    self.tablevview.tableHeaderView = cycleScrollView2;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  [self.listArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    TwoLostTableViewCell *cell = nil;
    
    TwoLists *list = self.listArr[indexPath.row];
    
    NSString *identf = [TwoLostTableViewCell cellIdentifierForRow:list];
    
     Class class = NSClassFromString(identf);
    
    cell = [tableView dequeueReusableCellWithIdentifier:identf];
    
    if (cell == nil) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identf];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.listModel = list;
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listArr.count == 0) return 44;
    TwoLists *frame = self.listArr[indexPath.row];
    return frame.cellHeight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

