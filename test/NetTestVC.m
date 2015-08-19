//
//  NetTestVC.m
//  test
//
//  Created by Charlie on 15/8/10.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "NetTestVC.h"
#import "testPostApiManager.h"
#import "XYApiResponse.h"

@interface NetTestVC () <BaseApiCallBackDelegate, BaseApiParamSourceDelegate, BaseApiValidateDelegate>
@property (strong, nonatomic) UIButton   * startRequestButton;
@property (strong, nonatomic) UIButton * startPostRequestButton;
@property (strong, nonatomic) UITextView * resultTextView;

@property (strong, nonatomic) testPostApiManager * testPostManager;
@property (strong, nonatomic) testApiManger * testManager;
@end

@implementation NetTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.startRequestButton];
    [self.view addSubview:self.startPostRequestButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_startRequestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(80);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    [_startPostRequestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-80);
        make.size.mas_equalTo(_startRequestButton);
    }];
}

- (void)startRequest:(UIButton *)button {
    if (button == _startPostRequestButton) {
        [self.testPostManager loadData];
    } else {
        [self.testManager loadData];
    }
}

- (testApiManger *)testManager {
    if (!_testManager) {
        _testManager = [[testApiManger alloc] init];
        _testManager.delegate = self;
        _testManager.datasource = self;
        _testManager.validator = self;
    }
    return _testManager;
}

- (testPostApiManager *)testPostManager {
    if (!_testPostManager) {
        _testPostManager = [[testPostApiManager alloc] init];
        _testPostManager.delegate = self;
        _testPostManager.datasource = self;
        _testPostManager.validator = self;
    }
    return _testPostManager;
}

#pragma mark -BaseApiCallBackDelegate
- (void)managerCallAPIDidFailed:(BaseApiManager *)manager responseObject:(XYApiResponse *)response {
    NSLog(@"%@",response.error.debugDescription);
}
- (void)managerCallAPIDidSuccess:(BaseApiManager *)manager responseObject:(XYApiResponse *)response {
    NSLog(@"%@",response.resultDictionary);
}

#pragma mark -BaseApiParamSourceDelegate
- (NSDictionary *)paramsForApi:(BaseApiManager *)manager {
    NSDictionary * paramsDictionary = @{@"location":@"31.214637,121.529124"};
    return paramsDictionary;
}

#pragma mark -BaseApiValidateDelegate
- (BOOL)manager:(BaseApiManager *)manager isCorrectWithApiParamsData:(NSDictionary *)data {
    return YES;
}

- (BOOL)manager:(BaseApiManager *)manager isCorrectWithCallBackData:(NSDictionary *)data {
    return YES;
}


- (UIButton *)startRequestButton {
    if (!_startRequestButton) {
        _startRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startRequestButton.backgroundColor = [UIColor blueColor];
        [_startRequestButton setTitle:@"Get" forState:UIControlStateNormal];
        [_startRequestButton addTarget:self action:@selector(startRequest:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startRequestButton;
}

- (UIButton *)startPostRequestButton {
    if (!_startPostRequestButton) {
        _startPostRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startPostRequestButton.backgroundColor = [UIColor orangeColor];
        [_startPostRequestButton setTitle:@"Post" forState:UIControlStateNormal];
        [_startPostRequestButton addTarget:self action:@selector(startRequest:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startPostRequestButton;
}

@end
