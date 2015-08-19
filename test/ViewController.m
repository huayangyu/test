//
//  ViewController.m
//  test
//
//  Created by Charlie on 18/12/31.
//  Copyright (c) 2018年 Charlie. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "ViVC.h"
#import "testCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"特";
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [self getData];
}

#pragma mark -
- (void)getData {
    
}

static NSString * cellIDE = @"testCellIdentifier";
#pragma mark -UITabelView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    testCell * cell = [_tableView dequeueReusableCellWithIdentifier:cellIDE];
    return cell;
}

#pragma mark -UITabelView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViVC * vc = [[ViVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[testCell class] forCellReuseIdentifier:@"testCellIdentifier"];
        
    }
    return _tableView;
}

@end
