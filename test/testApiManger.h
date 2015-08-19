//
//  testApiManger.h
//  test
//
//  Created by Charlie on 15/8/17.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "BaseApiManager.h"

@interface testApiManger : BaseApiManager

@property (nonatomic, copy, readonly) NSString * methodName;
@property (nonatomic, copy, readonly) NSString * serviceType;
@end
