//
//  MyButton.h
//  test
//
//  Created by Charlie on 15/7/28.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MyButtonClick <NSObject>

- (void)MyButtonClick;

@end

@interface MyButton : UIButton


@property (nonatomic, weak) id<MyButtonClick> delegate;

- (UIButton *)createButtonWithTitle:(NSString *)title bgColor:(UIColor *)color frame:(CGRect)frame;

@end
