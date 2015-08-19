//
//  testPostApiManager.m
//  test
//
//  Created by Charlie on 15/8/18.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "testPostApiManager.h"

@interface testPostApiManager () <BaseApiManagerProtocol>

@end

@implementation testPostApiManager

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
    return @"testPostApiManger";
}
- (BaseApiRequestType)requestType {
    return BaseApiRequestTypePost;
}


@end
