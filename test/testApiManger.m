//
//  testApiManger.m
//  test
//
//  Created by Charlie on 15/8/17.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "testApiManger.h"

@interface testApiManger () <BaseApiManagerProtocol>

@end

@implementation testApiManger

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.child = self;
    }
    return self;
}

#pragma mark -BaseApiManagerProtocol

- (NSString *)methodName {
    return @"/flagshipretailstore/qiaogu/shanghai/list/index";
}
- (NSString *)serviceType {
    return @"testApiManger";
}
- (BaseApiRequestType)requestType {
    return BaseApiRequestTypeGet;
}


@end
