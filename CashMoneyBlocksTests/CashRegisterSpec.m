//
//  CashRegisterSpec.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 11/12/14.
//  Copyright 2014 Zachary Drossman. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "CashRegister.h"
#import "Transaction.h"
#import "Product.h"
#import "Store.h"



SpecBegin(CashRegister)

describe(@"CashRegister", ^{
    
    __block NSArray *transactions;
    __block CashRegister *cashRegister;
    __block Store *store;
    
    beforeAll(^{
    
        //Setup test data code here, using the test data we gave you in the README.

    });
    
    beforeEach(^{
        
        //Do all of your initialization here so you start with a fresh model for each test!
        
    });
    
    describe(@"applyCoupon method", ^{
        it(@"should return the total discounts of all transactions for a register", ^{
            
            //Set the couponLogic block to the same logic as provided in the README for couponLogic here.
            
            expect([cashRegister applyCoupons]).to.equal(@13.66);
        });
        
        
    });
    
    describe(@"calculateTax method", ^{
        
        it(@"should return the tax of all transactions for a register", ^{
            
            //Set the taxLogic block to the same logic as provided in the README for taxLogic here.

            expect([cashRegister calculateTax]).to.equal(@2.999);
        });
        
    });

});

SpecEnd
