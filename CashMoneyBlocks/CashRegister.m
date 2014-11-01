//
//  CashRegister.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "CashRegister.h"

@implementation CashRegister

-(void)applyCoupons {
    
    for (Transaction *transaction in self.transactions) {
        self.couponLogic(transaction);
    }
}

-(void)calculateTax {
    for (Transaction *transaction in self.transactions) {
        self.taxLogic(transaction);
    }
}

@end
