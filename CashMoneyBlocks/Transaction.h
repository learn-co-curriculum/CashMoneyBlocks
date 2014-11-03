//
//  Transaction.h
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
@interface Transaction : NSObject

@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) NSNumber *quantity;
@property (strong, nonatomic) NSNumber *fullTransactionValue;
@property (strong, nonatomic) NSDate *dateOfTransaction;

- (instancetype)initWithProduct:(Product *)product Quantity:(NSNumber *)quantity Date:(NSDate *)dateOfTransaction;

- (instancetype)init;

@end
