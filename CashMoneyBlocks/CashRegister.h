//
//  CashRegister.h
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Transaction;
#import "Store.h"

@interface CashRegister : NSObject

@property (strong, nonatomic) Store *store;
@property (strong, nonatomic) NSArray *transactions;
@property (nonatomic, copy) NSNumber * (^couponLogic)(Transaction *transaction);
@property (nonatomic, copy) NSNumber * (^taxLogic)(Transaction *transaction);

-(void)applyCoupons;
-(void)calculateTax;

@end
