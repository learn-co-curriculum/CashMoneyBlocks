//
//  RetailerCustomization.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "RetailerCustomization.h"
#import "Product.h"
#import "Transaction.h"
#import "CashRegister.h"
#import "State.h"

@implementation RetailerCustomization

- (void)customizeRegisterLogic:(CashRegister *)cashRegister {
    
    cashRegister.taxLogic = ^NSNumber *(Transaction *transaction) {
    
        NSNumber *taxAmount = @([[self netPrice:transaction.product] floatValue] * [cashRegister.store.state.taxRate floatValue]);
        
        switch (transaction.product.productCategory) {
            case ProductCategoryGrocery:
                
                return @0;
                
            case ProductCategoryApparel:
                
                if ([cashRegister.store.state.abbreviation isEqualToString:@"NY"] &&  [[self netPrice:transaction.product] floatValue]  < 100)
                {
                    return @0;
                }
                
                return taxAmount;
                
            case ProductCategoryEducation:
                
                //should be based on date of transaction, but will come back to this later...

                return nil;
                
            case ProductCategoryLuxuryItem:
                
                return @([taxAmount floatValue] * 2);
                
            default:
                return taxAmount;
        }
        
        return nil;
    };
    
    cashRegister.couponLogic = ^NSNumber *(Transaction *transaction) {
        
        return nil;
    };

}

- (NSNumber *)netPrice:(Product *)product {
    
    return (@([product.price floatValue]- [product.discountInDollars floatValue]));
}

- (NSArray *)generateTransactionData {
    
    Product *apple = [[Product alloc] initWithProductDescription:@"Granny Smith" UPC:@"0000000000415" Price:@0.95 DiscountInDollars:@0.00 Size:@1 Measure:@"ea" andProductCategory:ProductCategoryGrocery];
    
    Product *cereal = [[Product alloc] initWithProductDescription:@"Cracklin' Oat Bran" UPC:@"0038000045301" Price:@4.99 DiscountInDollars:@1.20 Size:@17 Measure:@"oz" andProductCategory:ProductCategoryGrocery];
    
    Product *vanillaGoGurt = [[Product alloc] initWithProductDescription:@"Vanilla GoGurt - To Stay, 7 oz" UPC:@"0038000045301" Price:@1.99 DiscountInDollars:@0.00 Size:@17 Measure:@"oz" andProductCategory:ProductCategoryGrocery];
    
    Product *sliceSoda = [[Product alloc] initWithProductDescription:@"That soda that you've probably heard of was once a competitor to Sprite" UPC:@"12000810060" Price:@1.99 DiscountInDollars:@0.50 Size:@67.628 Measure:@"fl oz" andProductCategory:ProductCategoryGrocery];
    
    Product *siliconValleyHoodie = [[Product alloc] initWithProductDescription:@"Silicon Valley Hoodie - Size M" UPC:@"55000030387" Price:@42.99 DiscountInDollars:@0.00 Size:@2 Measure:@"Mens Tee" andProductCategory:ProductCategoryGrocery];
    
    Product *functionalProgrammingWithSwiftBook = [[Product alloc] initWithProductDescription:@"Functional Programming in Swift" UPC:@"66611000000" Price:@29.99 DiscountInDollars:@4.00 Size:@417 Measure:@"pages" andProductCategory:ProductCategoryGrocery];

    
    Transaction *transactionOne = [[Transaction alloc] initWithProduct:apple Quantity:@1];
    
    Transaction *transactionTwo = [[Transaction alloc] initWithProduct:cereal Quantity:@2];
    
    Transaction *transactionThree = [[Transaction alloc] initWithProduct:vanillaGoGurt Quantity:@10];
    
    Transaction *transactionFour = [[Transaction alloc] initWithProduct:sliceSoda Quantity:@1];

    Transaction *transactionFive = [[Transaction alloc] initWithProduct:siliconValleyHoodie Quantity:@1];
    
    Transaction *transactionSix = [[Transaction alloc] initWithProduct:functionalProgrammingWithSwiftBook Quantity:@1];

    NSArray *transactions = @[transactionOne, transactionTwo, transactionThree, transactionFour, transactionFive, transactionSix];
    
    return transactions;
    
}

@end
