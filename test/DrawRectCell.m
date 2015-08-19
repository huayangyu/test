//
//  DrawRectCell.m
//  test
//
//  Created by Charlie on 15/8/19.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "DrawRectCell.h"

@implementation DrawRectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)drawALine {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextMoveToPoint(ctx, 0, 10);
    CGContextAddLineToPoint(ctx, 320, 10);
    CGContextStrokePath(ctx);
}

- (void)drawPath {
    UIColor *color = [UIColor redColor];
    [color set];
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;

    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(0, 20)];
    [aPath addLineToPoint:CGPointMake(200.0, 20.0)];
    [aPath closePath];
    [aPath stroke];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self drawALine];
    [self drawPath];
}


@end
