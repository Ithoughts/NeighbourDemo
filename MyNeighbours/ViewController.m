//
//  ViewController.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "NeighbourInfo+request.h"
#import "NSDictionary+ParseLocalJSON.h"
#import "NeighbourInfo.h"
#import <MTLJSONAdapter.h>
#import "NeighbourTableViewCell.h"

static NSString * const kCellID = @"kNeighbourCellID";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *neighbourArray;
    NSMutableDictionary *heightDict;
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    heightDict = [NSMutableDictionary dictionary];
    
    _mTableView.tableFooterView = [[UIView alloc] init];
    [_mTableView registerClass:[NeighbourTableViewCell class] forCellReuseIdentifier:kCellID];
    _mTableView.estimatedRowHeight = 100;
    
    NSDictionary *testDict = [NSDictionary dictionaryWithContentsOfJSONString:@"TestJSONData" andFileType:@"json"];
    
    neighbourArray = [MTLJSONAdapter modelsOfClass:[NeighbourInfo class] fromJSONArray:testDict[@"results"] error:nil];
    
    [_mTableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return neighbourArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NeighbourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    
    NeighbourInfo *neighbourInfo = neighbourArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CGFloat cellHeight = [cell bindDataWithNeighbourModel:neighbourInfo];
    if (!heightDict[indexPath]) {
        
        heightDict[indexPath] = @(cellHeight);
      
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!heightDict[indexPath]) {
        return 200;
    }
    return [heightDict[indexPath] floatValue];
}

@end
