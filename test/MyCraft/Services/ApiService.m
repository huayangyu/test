//
//  ApiService.m
//  test
//
//  Created by Charlie on 15/8/13.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "ApiService.h"

@implementation ApiService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.child = self;
    }
    return self;
}

- (NSString *)apiBaseUrl {
    #ifdef DEBUG
        return @"http://app.715buy.com";
    #else
        return @"";
    #endif
}

- (NSString *)apiVersion {
    return @"";
}

@end
