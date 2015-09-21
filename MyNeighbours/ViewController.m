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
    NeighbourInfo *neighbour;
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_mTableView registerClass:[NeighbourTableViewCell class] forCellReuseIdentifier:kCellID];
    NSDictionary *testDict = [NSDictionary dictionaryWithContentsOfJSONString:@"TestJSONData" andFileType:@"json"];
 //   NSLog(@"%@",testDict);
    
    
    neighbourArray = [MTLJSONAdapter modelsOfClass:[NeighbourInfo class] fromJSONArray:testDict[@"results"] error:nil];
    NSLog(@"neighbour is %@", neighbourArray);
    
    neighbour = neighbourArray[3];
    
    [_mTableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NeighbourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell bindDataWithNeighbourModel:neighbour];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
