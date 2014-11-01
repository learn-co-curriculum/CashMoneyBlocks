//
//  Transaction.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction


- (instancetype)initWithProduct:(Product *)product Quantity:(NSNumber *)quantity Date:(NSDate)dateOfTransaction
{
    self = [super init];
    if (self) {
        _product = product;
        _quantity = quantity;
        _dateOfTransaction = dateOfTransaction;
        _fullTransactionValue = @([product.price floatValue] * [quantity floatValue]);
        _discountedTransactionValue = @([product.price floatValue] * [quantity floatValue] - [product.discountInDollars floatValue] * [quantity floatValue]);
    }
    return self;
}

- (instancetype)init {
    return [self initWithProduct:nil Quantity:@0];
}

@end
