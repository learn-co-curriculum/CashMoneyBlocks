//
//  Store.h
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"


@interface Store : NSObject

@property (strong, nonatomic) State *state;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *storeID;

- (instancetype)initWithStoreID:(NSString *)storeID City:(NSString *)city State:(State *)state;
- (instancetype)init;

@end
