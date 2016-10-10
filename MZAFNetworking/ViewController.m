//
//  ViewController.m
//  MZAFNetworking
//
//  Created by CiHon-IOS2 on 16/9/30.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ViewController.h"
#import "ZmzRequest.h"
#import "JSONKit.h"
#import "MJExtension.h"
#import "ListModelFrame.h"
#import "Lists.h"
#import "ListTableViewCell.h"
#import "TwoViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tablevview;
@property(nonatomic,strong)NSArray *listModelArr;
@end

@implementation ViewController

-(UITableView *)tablevview
{
    if (!_tablevview) {
        _tablevview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tablevview.delegate = self;
        _tablevview.dataSource = self;
    }
    return _tablevview;
}

-(NSArray *)listModelArr
{
    if (!_listModelArr) {
        _listModelArr = [[NSArray alloc]init];
    }
    return _listModelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"列表";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(rightbar)];
    
    [self.view addSubview:self.tablevview];
    
    [self bbb];
}


-(void)bbb{
    
    NSDictionary *param = @{
                            @"auth" : @"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                            @"client" : @"1",
                            @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                            @"limit" : @"10",
                            @"start" : @0,
                            @"version":@"3.0.6"
                            };
    
    ZmzRequest *zquest = [[ZmzRequest alloc]init];
    
    [zquest getDateWithParams:param WithDataBlock:^(id ServersData, BOOL isSuccess) {
       
       /*
        NSString *jsonstr = [ServersData JSONString];
        NSData *data = [jsonstr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *newDic = [data objectFromJSONData];
       
        NSLog(@"%@-----------%@",newDic,jsonstr);
        */
        
        NSDictionary *dataDic = ServersData[@"data"];
        NSDictionary *listDic = dataDic[@"list"];
        NSArray *listModel = [Lists mj_objectArrayWithKeyValuesArray:listDic];
        
        self.listModelArr = [self listFrameWithListModel:listModel];
        
        [self.tablevview reloadData];
        
    }];

}

#pragma mark-表格数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listModelArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"zmz";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[ListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    ListModelFrame *frame = self.listModelArr[indexPath.row];
    cell.listFrame = frame;
    
    
    return cell;
}
#pragma mark-表格代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listModelArr.count == 0) return 44;
    ListModelFrame *frame = self.listModelArr[indexPath.row];
    return frame.cellHeight;
}
/**
 *   将传递进来的数组转换成Frame数组
 */
- (NSArray *)listFrameWithListModel:(NSArray *)listModelArray
{
    NSMutableArray *frames = [NSMutableArray array];
    for (Lists *model in listModelArray) {
        ListModelFrame *frame = [[ListModelFrame alloc] init];
        frame.list = model;
        [frames addObject:frame];
    }
    return frames;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)rightbar{
    
    
    
    ZmzRequest *request = [[ZmzRequest alloc]init];
    
    [request getListDataBlock:^(id ServersData, BOOL isSuccess) {
        NSDictionary *dicData = [ServersData objectForKey:@"data"];
        
        NSMutableArray *marr = [NSMutableArray array];
        NSArray *imarr = [dicData objectForKey:@"carousel"];
        
        for (NSDictionary *dic in imarr) {
            [marr addObject:[dic objectForKey:@"img"]];
        }
        
        if ([marr count]) {
            TwoViewController *tc = [[TwoViewController alloc]init];
            tc.imageArr = [marr mutableCopy];
            tc.codic = dicData;
            [self.navigationController pushViewController:tc animated:YES];
        }
        
    }];

    
    
    
    
}

@end

