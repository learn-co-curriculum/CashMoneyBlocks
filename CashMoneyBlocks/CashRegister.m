//
//  CashRegister.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "CashRegister.h"

@implementation CashRegister

-(NSNumber *)applyCoupons {
    
    NSNumber *totalSaved = @0;
    
    for (Transaction *transaction in self.transactions) {
        totalSaved = @([totalSaved floatValue] + [self.couponLogic(transaction) floatValue]);
    }
    
    return totalSaved;
}

-(NSNumber *)calculateTax {
    
    NSNumber *totalTax = @0;
    
    for (Transaction *transaction in self.transactions) {
        totalTax = @([totalTax floatValue] + [self.taxLogic(transaction) floatValue]);
    }
    
    return totalTax;
    
}

@end
