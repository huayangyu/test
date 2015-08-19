//
//  NavigationViewController.m
//  test
//
//  Created by Charlie on 15/7/8.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "NavigationViewController.h"
#import "ViewController.h"

@interface NavigationViewController ()
//{
//    UIButton *_pushBtn;
//}
@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:self.pushBtn];
}

- (void)d
{
    ViewController * vc = [[ViewController alloc] init];
    [self pushViewController:vc
                    animated:YES];
}

- (UIButton *)pushBtn {
    if (!_pushBtn) {
        CGRect frame = CGRectMake(0, 0, 100, 100);
        _pushBtn = [[UIButton alloc] initWithFrame:frame];
        _pushBtn.center = self.view.center;
        _pushBtn.backgroundColor = [UIColor blueColor];
        [_pushBtn addTarget:self action:@selector(d) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}

@end
