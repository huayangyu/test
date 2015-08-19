//
//  ApiProxyCasa.m
//  test
//
//  Created by Charlie on 15/8/13.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "ApiProxyCasa.h"
#import "RequestGenerator.h"
#import <AFHTTPRequestOperation.h>
#import <AFHTTPRequestOperationManager.h>
#import "XYApiResponse.h"

@interface ApiProxyCasa ()
@property (strong ,nonatomic) NSNumber * recordedRequestId;
@property (strong ,nonatomic) AFHTTPRequestOperationManager * operationManager;
//used to cancel the request operation
@property (strong ,nonatomic) NSMutableDictionary * dispatchTable;
@end

@implementation ApiProxyCasa

+ (instancetype)sharedInstance {
    static ApiProxyCasa * casa = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        casa = [[ApiProxyCasa alloc] init];
    });
    return casa;
}

- (NSMutableDictionary *)dispatchTable {
    if (!_dispatchTable) {
        _dispatchTable = [NSMutableDictionary dictionary];
    }
    return _dispatchTable;
}

- (AFHTTPRequestOperationManager *)operationManager {
    if (!_operationManager) {
        _operationManager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return _operationManager;
}

- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName success:(ApiProxyCallBack)success fail:(ApiProxyCallBack)fail {
    NSURLRequest * request = [[RequestGenerator sharedInstance] generateGETRequestWithServiceIdentifier:serviceIdentifier params:params methodName:methodName];
    NSNumber * requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName success:(ApiProxyCallBack)success fail:(ApiProxyCallBack)fail {
    NSURLRequest * request = [[RequestGenerator sharedInstance] generatePOSTRequestWithServiceIdentifier:serviceIdentifier params:nil methodName:methodName];
    NSNumber * requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSNumber *)callApiWithRequest:(NSURLRequest *)request success:(ApiProxyCallBack)success fail:(ApiProxyCallBack)fail {
    NSNumber * requestId = [self generateRequestId];
    //跑到block里，表示requestOperation已经完成任务了，casa的话说是回到主线程了

    AFHTTPRequestOperation * httpRequstOperation = [self.operationManager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        AFHTTPRequestOperation * requestOperation = self.dispatchTable[requestId];
        if (requestOperation == nil) {
            //the request operation has been canceled, so do nothing later
            return;
        } else {
            [_dispatchTable removeObjectForKey:requestId];
        }
        XYApiResponse * response = [[XYApiResponse alloc] init];
        response.resultObject = responseObject;
        response.httpRequestOperation = operation;
        response.message = responseObject[@"message"];
        response.resultDictionary = (NSDictionary *)responseObject[@"result"];
        success?success(response):nil;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        AFHTTPRequestOperation * requestOperation = self.dispatchTable[requestId];
        if (requestOperation == nil) {
            return;
        } else {
            [_dispatchTable removeObjectForKey:requestId];
        }
        XYApiResponse * response = [[XYApiResponse alloc] init];
        response.httpRequestOperation = operation;
        response.error = error;
        fail?fail(response):nil;
    }];
    
    self.dispatchTable[requestId] = httpRequstOperation;
    [self.operationManager.operationQueue addOperation:httpRequstOperation];
    return requestId;
}

- (NSNumber *)generateRequestId {
    if (!_recordedRequestId) {
        _recordedRequestId = @(1);
    } else {
        if ([_recordedRequestId integerValue] == NSIntegerMax) {
            _recordedRequestId = @(1);
        } else {
            _recordedRequestId = @([_recordedRequestId integerValue] + 1);
        }
    }
    return _recordedRequestId;
}

@end
