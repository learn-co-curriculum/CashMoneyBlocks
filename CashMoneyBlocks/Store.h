//
//  Store.h
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"
#import "CashRegister.h"

@interface Store : NSObject

@property (strong, nonatomic) State *state;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *storeID;
@property (strong, nonatomic) CashRegister *cashRegister;

- (instancetype)initWithStoreID:(NSString *)storeID City:(NSString *)city State:(State *)state andCashRegister:(CashRegister *)cashRegister;
- (instancetype)init;

@end
