//
//  XYApiResponse.h
//  test
//
//  Created by Charlie on 15/8/17.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperation.h>
@interface XYApiResponse : NSObject

@property (nonatomic, strong) AFHTTPRequestOperation * httpRequestOperation;
@property (nonatomic, strong) id resultObject;
@property (nonatomic, strong) NSError * error;
@property (nonatomic, strong) NSDictionary * resultDictionary;
@property (nonatomic, strong) NSString * message;

@end
