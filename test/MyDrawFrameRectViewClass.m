//
//  MyDrawFrameRectViewClass.m
//  test
//
//  Created by Charlie on 15/7/8.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "MyDrawFrameRectViewClass.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation MyDrawFrameRectViewClass

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        view.backgroundColor = [UIColor purpleColor];
        [self addSubview:view];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect  myframe = self.bounds;
    CGContextSetLineWidth(context, 30);
    self.layer.cornerRadius = 10;
    CGRectInset(myframe, 5, 5);
    [[UIColor cyanColor] set];
    UIRectFrame(myframe);
}


@end
