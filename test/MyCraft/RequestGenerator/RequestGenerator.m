//
//  RequestGenerator.m
//  test
//
//  Created by Charlie on 15/8/13.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "RequestGenerator.h"
#import "ApiServiceFactory.h"
#import "NSDictionary+MyCraft.h"
#import "NSURLRequest+MyCraft.h"
#import <AFNetworking.h>

@interface RequestGenerator ()
@property (nonatomic, strong) AFHTTPRequestSerializer * httpRequestSerializer;
@end

@implementation RequestGenerator

+ (instancetype)sharedInstance {
    static RequestGenerator * generator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        generator = [[RequestGenerator alloc] init];
    });
    return generator;
}

- (AFHTTPRequestSerializer *)httpRequestSerializer {
    if (!_httpRequestSerializer) {
        _httpRequestSerializer = [[AFHTTPRequestSerializer alloc] init];
        _httpRequestSerializer.timeoutInterval = 15;
    }
    return _httpRequestSerializer;
}

- (NSURLRequest *)generateGETRequestWithServiceIdentifier:(NSString *)serviceIdentifier params:(NSDictionary *)params methodName:(NSString *)methodName {
    NSDictionary * paramsDictionary = [[NSDictionary dictionaryWithDictionary:params] copy];
    ApiService * service = [[ApiServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString * urlString = [NSString stringWithFormat:@"%@/%@",service.apiBaseUrl,methodName];
    NSMutableURLRequest * request = [self.httpRequestSerializer requestWithMethod:@"GET" URLString:urlString parameters:params error:NULL];
    request.requestParams_test = paramsDictionary;
    return request;
}

- (NSURLRequest *)generatePOSTRequestWithServiceIdentifier:(NSString *)serviceIdentifier params:(NSDictionary *)params methodName:(NSString *)methodName {
    ApiService * service = [[ApiServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString * urlString = [NSString stringWithFormat:@"%@/%@",service.apiBaseUrl,methodName];
    NSMutableURLRequest * request = [self.httpRequestSerializer requestWithMethod:@"POST" URLString:urlString parameters:params error:NULL];
    return request;
}

@end
