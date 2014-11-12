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

        Product *apple = [[Product alloc] initWithProductDescription:@"Granny Smith" UPC:@"0000000000415" Price:@0.95  Size:@1 Measure:@"ea" andProductCategory:ProductCategoryGrocery];
        
        Product *cereal = [[Product alloc] initWithProductDescription:@"Cracklin' Oat Bran" UPC:@"0038000045301" Price:@4.99 Size:@17 Measure:@"oz" andProductCategory:ProductCategoryGrocery];
        
        Product *vanillaGoGurt = [[Product alloc] initWithProductDescription:@"Vanilla GoGurt - To Stay, 7 oz" UPC:@"0038000045301" Price:@1.99 Size:@17 Measure:@"oz" andProductCategory:ProductCategoryGrocery];
        
        Product *sliceSoda = [[Product alloc] initWithProductDescription:@"That soda that you've probably heard of was once a competitor to Sprite" UPC:@"12000810060" Price:@1.99 Size:@67.628 Measure:@"fl oz" andProductCategory:ProductCategoryGrocery];
        
        Product *siliconValleyHoodie = [[Product alloc] initWithProductDescription:@"Silicon Valley Hoodie - Size M" UPC:@"55000030387" Price:@42.99 Size:@2 Measure:@"Mens Tee" andProductCategory:ProductCategoryApparel];
        
        Product *functionalProgrammingWithSwiftBook = [[Product alloc] initWithProductDescription:@"Functional Programming in Swift" UPC:@"66611000000" Price:@29.99 Size:@417 Measure:@"pages" andProductCategory:ProductCategoryEducation];
        
        
        NSCalendar *calendar = [[NSCalendar alloc]
                                initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.calendar = calendar;
        components.year = 2014;
        components.month = 5;
        components.day = 12;
        components.hour = 16;
        components.minute = 1;
        components.second = 12;
        
        NSDate *date1 = [calendar dateFromComponents:components];
        
        Transaction *transactionOne = [[Transaction alloc] initWithProduct:apple Quantity:@25 Date:date1];
        
        components.year = 2014;
        components.month = 9;
        components.day = 15;
        components.hour = 2;
        components.minute = 22;
        components.second = 43;
        NSDate *date2 = [calendar dateFromComponents:components];
        
        Transaction *transactionTwo = [[Transaction alloc] initWithProduct:cereal Quantity:@14 Date:date2];
        
        components.year = 2014;
        components.month = 6;
        components.day = 12;
        components.hour = 12;
        components.minute = 0;
        components.second = 1;
        NSDate *date3 = [calendar dateFromComponents:components];
        
        Transaction *transactionThree = [[Transaction alloc] initWithProduct:vanillaGoGurt Quantity:@5 Date:date3];
        
        components.year = 2014;
        components.month = 6;
        components.day = 12;
        components.hour = 12;
        components.minute = 0;
        components.second = 1;
        NSDate *date4 = [calendar dateFromComponents:components];
        
        Transaction *transactionFour = [[Transaction alloc] initWithProduct:sliceSoda Quantity:@1 Date:date4];
        
        components.year = 2014;
        components.month = 6;
        components.day = 12;
        components.hour = 12;
        components.minute = 0;
        components.second = 4;
        NSDate *date5 = [calendar dateFromComponents:components];
        
        Transaction *transactionFive = [[Transaction alloc] initWithProduct:siliconValleyHoodie Quantity:@1 Date:date5];
        
        components.year = 2014;
        components.month = 6;
        components.day = 12;
        components.hour = 12;
        components.minute = 0;
        components.second = 10;
        NSDate *date6 = [calendar dateFromComponents:components];
        
        Transaction *transactionSix = [[Transaction alloc] initWithProduct:functionalProgrammingWithSwiftBook Quantity:@1 Date:date6];
        
        transactions = @[transactionOne, transactionTwo, transactionThree, transactionFour, transactionFive, transactionSix];
        
    });
    
    beforeEach(^{
        
        //Do all of your initialization here so you start with a fresh model for each test!
        
        cashRegister = [[CashRegister alloc] init];
        
        store = [[Store alloc] init];
        State *state = [[State alloc] init];
        store.state = state;
        state.abbreviation = @"NY";
        store.cashRegister= cashRegister;
        cashRegister.transactions = transactions;
        
    });
    
    describe(@"applyCoupon method", ^{
        it(@"should return the total discounts of all transactions for a register", ^{
            
            //Set the couponLogic block to the same logic as provided in the README for couponLogic here.
            store.cashRegister.couponLogic = ^NSNumber *(Transaction *transaction) {
                
                if ([transaction.fullTransactionValue floatValue] > 10.0 && transaction.product.productCategory != ProductCategoryEducation)
                {
                    return (@([transaction.fullTransactionValue floatValue] * .10));
                }
                else
                    return @0;
            };
            
            expect([cashRegister applyCoupons]).to.equal(@13.66);
        });
    });
    
    describe(@"calculateTax method", ^{
        
        it(@"should return the tax of all transactions for a register", ^{
            
            //Set the taxLogic block to the same logic as provided in the README for taxLogic here.

            cashRegister.taxLogic = ^NSNumber *(Transaction *transaction) {
                
                NSNumber *taxAmount = @([transaction.product.price floatValue] * [store.state.taxRate floatValue]);
                
                NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                
                NSDateComponents *components = [[NSDateComponents alloc] init];
                
                switch (transaction.product.productCategory) {
                    case ProductCategoryGrocery:
                        
                        return @0;
                        
                    case ProductCategoryApparel:
                        
                        if ([store.state.abbreviation isEqualToString:@"NY"] &&  [transaction.product.price floatValue]  < 100)
                        {
                            return @0;
                        }
                        
                        return taxAmount;
                        
                    case ProductCategoryEducation:
                    {
                        components.calendar = calendar;
                        components.year = 2014;
                        components.month = 8;
                        components.day = 1;
                        components.hour = 0;
                        components.minute = 0;
                        components.second = 0;
                        
                        NSDate *startOfSchoolShoppingSeason = [calendar dateFromComponents:components];
                        
                        components.calendar = calendar;
                        components.year = 2014;
                        components.month = 9;
                        components.day = 30;
                        components.hour = 23;
                        components.minute = 59;
                        components.second = 59;
                        
                        NSDate *endOfSchoolShoppingSeason = [calendar dateFromComponents:components];
                        
                        if (([transaction.dateOfTransaction compare:startOfSchoolShoppingSeason] == NSOrderedAscending) && ([transaction.dateOfTransaction compare:endOfSchoolShoppingSeason] == NSOrderedDescending)) {
                            return @0;
                        }
                        
                        return taxAmount;
                        
                    }
                    case ProductCategoryLuxuryItem:
                        
                        return @([taxAmount floatValue] * 2);
                        
                    default:
                        return taxAmount;
                }
                
                return nil;
            };

            expect([cashRegister calculateTax]).to.equal(@2.999);
        });
        
    });

});

SpecEnd
