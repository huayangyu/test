//
//  MyButton.m
//  test
//
//  Created by Charlie on 15/7/28.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (UIButton *)createButtonWithTitle:(NSString *)title bgColor:(UIColor *)color frame:(CGRect)frame {
    UIButton * btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:color];
    if ([_delegate respondsToSelector:@selector(MyButtonClick)]) {
        [_delegate performSelector:@selector(MyButtonClick)];
    }
    return btn;
}


@end
