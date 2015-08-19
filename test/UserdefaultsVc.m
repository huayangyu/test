//
//  UserdefaultsVc.m
//  test
//
//  Created by Charlie on 15/8/11.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "UserdefaultsVc.h"
#import <POP.h>
#import "A.h"

@interface UserdefaultsVc ()
{
    NSUserDefaults * _user;
}

@property (strong, nonatomic) UIButton * button;
@property (strong, nonatomic) UIButton * button_clear;
@property (strong, nonatomic) UIButton * button_show;
@end

#define kScreenWidth [UIScreen  mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation UserdefaultsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.button];
    [self.view addSubview:self.button_clear];
    [self.view addSubview:self.button_show];
    
    _user = [NSUserDefaults standardUserDefaults];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self makeConstrants];
}

- (void)clear {
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (void)store {
    [_user setObject:@"test" forKey:@"test"];
}

- (void)show {
    UIAlertView * al = [[UIAlertView alloc] initWithTitle:@"" message:[_user objectForKey:@"test"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [al show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeConstrants {
    
    [_button_show mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@[@(100),@(100)]);
        make.center.equalTo(self.view);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@[@(100),@(100)]);
        make.bottom.equalTo(_button_show.mas_top).offset(-20);
        make.centerX.equalTo(self.view);
    }];
    
    [_button_clear mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@[@(100),@(100)]);
        make.top.equalTo(_button_show.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
    }];
    
    _button.layer.cornerRadius = 50;
    _button_clear.layer.cornerRadius = 50;
    _button_show.layer.cornerRadius = 50;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"store" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor redColor]];
        [_button addTarget:self action:@selector(store) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button;
}

- (UIButton *)button_clear {
    if (!_button_clear) {
        _button_clear = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button_clear setTitle:@"clear" forState:UIControlStateNormal];
        [_button_clear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button_clear setBackgroundColor:[UIColor blueColor]];
        [_button_clear addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button_clear;
}

- (UIButton *)button_show {
    if (!_button_show) {
        _button_show = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button_show setTitle:@"show" forState:UIControlStateNormal];
        [_button_show setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button_show setBackgroundColor:[UIColor greenColor]];
        [_button_show addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button_show;
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
