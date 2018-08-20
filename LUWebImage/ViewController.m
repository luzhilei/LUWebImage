//
//  ViewController.m
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "ViewController.h"
#import <Rango/Rango.h>
#import "TableViewCell.h"
#import "UIImageView+WebCache.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)NSArray * dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     引入 Rango.framework  tableview 自定义展示数据
     1，图片缓存逻辑
     2，自适应高度
     3，点击ClickInfo.str  跳转 url
     
     主要实现逻辑：
     1 ，图片缓存逻辑 仿SDWebImage
     
     从网络获取图片 ->  检查内存缓存 -> 有 从内存加载图片
                          ↓
                    没有，检查沙盒缓存 -> 有  从沙盒加载图片 ，并拷贝一份在 内存上
                          ↓
                    没有，从网络加载  -> 有 写入沙盒 ，写入内存
                          ↓
                    没有，图片地址不对
     
     2，通过 boundingRectWithSize 计算高度
     3，通过 textView 添加 NSLinkAttributeName 添加跳转
     
     */
  
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    NSString *str = NSHomeDirectory();
    NSLog(@"%@",str);
    
    //静态包数据
    self.dataArray = [LUModel getAllData];
    [self.tableView reloadData];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model = [self.dataArray objectAtIndex:indexPath.row ];
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
      LUModel *model = [self.dataArray objectAtIndex:indexPath.row ];
    
    CGFloat height  = [model.content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 130, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    if (height < 70) {
        return 120;
    }
    return 50 + height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
}
-(void)didReceiveMemoryWarning{
    
}

@end
