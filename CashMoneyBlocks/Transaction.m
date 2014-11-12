//
//  Transaction.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

@synthesize product = _product;

- (instancetype)initWithProduct:(Product *)product Quantity:(NSNumber *)quantity Date:(NSDate *)dateOfTransaction
{
    
    [[NSNumber numberWithFloat:23.0] stringValue];
    self = [super init];
    if (self) {
        _product = product;
        _quantity = quantity;
        _dateOfTransaction = dateOfTransaction;
        _fullTransactionValue = @([product.price floatValue] * [quantity floatValue]);
    }
    return self;
}

- (instancetype)init {
    return [self initWithProduct:nil Quantity:@0 Date:[NSDate date]];
}

@end
