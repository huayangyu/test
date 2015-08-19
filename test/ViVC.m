//
//  ViVC.m
//  test
//
//  Created by Charlie on 15/7/29.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "ViVC.h"
#import <pop/POP.h>

@interface ViVC ()
@property (nonatomic, strong) UIButton * button;
@end

@implementation ViVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@[@(20),@(20)]);
        make.top.equalTo(self.view.mas_top).offset(20 + 64);
        make.left.equalTo(self.view.mas_left).offset(20);
    }];
}

- (void)buttonClick {
    //.POPSpringAnimation
    POPSpringAnimation * springBgcolorAnimation = [POPSpringAnimation animation];
    POPAnimatableProperty * property = [POPAnimatableProperty propertyWithName:kPOPLayerBackgroundColor];
    springBgcolorAnimation.property = property;
    springBgcolorAnimation.toValue = (__bridge id)([UIColor blueColor].CGColor);

    POPSpringAnimation * springSizeAnimation = [POPSpringAnimation animation];
    POPAnimatableProperty * property1 = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    springSizeAnimation.property = property1;
    springSizeAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(40, 40)];
    springSizeAnimation.springBounciness = 10.0;
    springSizeAnimation.springSpeed = 10.0;

    [_button.layer pop_addAnimation:springBgcolorAnimation forKey:@"BackgroundColor"];
    [_button.layer pop_addAnimation:springSizeAnimation forKey:@"Size"];
}

#pragma mark -
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor redColor];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    _button.layer.cornerRadius = _button.frame.size.width / 2.;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
