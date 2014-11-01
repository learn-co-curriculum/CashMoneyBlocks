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
        totalSaved = self.couponLogic(transaction);
    }
    
    return totalSaved;
}

-(NSNumber *)calculateTax {
    
    NSNumber *totalTax = @0;
    
    for (Transaction *transaction in self.transactions) {
        totalTax = self.taxLogic(transaction);
    }
    
    return totalTax;
    
}

@end
