---
tags: blocks
languages: objc
---

# CashMoneyBlocks

## Instructions

You are the lead software engineer for a manufacturer that makes the cash register hardware. Clients generally want to be able to program their cash registers after the fact to use their own receipt formats and program items into the register such that the pricing rules can change periodically (e.g. couponing, taxes, etc.)

As the manufacturer you do NOT want the end user to modify the cash register code, so you decide you are going to give them blocks as arguments for the methods that build the format of each transaction on the receipt so that they do not have to change anything in the register library itself.

To speed this up a little, your junior developer has provided you with a basic `Product`, `Transaction`, `Store` and `State` class, complete with properties and initializers where needed.

As senior developer, you have to do the heavy lifting of the blocks. Ha. Ha. Ha.

Here is what you will need:

1) A `CashRegister` class with four properties including:

@property (strong, nonatomic) Store *store;
@property (strong, nonatomic) NSArray *transactions;

as well as two block properties. Since this is a lab on blocks, we'll let you figure out how to write those up. You'll want one for `couponLogic` and another for `taxLogic`. (JOE - SHOULD WE TELL THEM WHAT THE ARGUMENTS AND RETURN VALUES ARE FOR THESE BLOCKS?)

This class will also have two methods called `applyCoupons` and `calculateTax`. They will NSLog the total value of all coupons and total amount of tax for all transactions on the `CashRegister` respectively.

2) A `RetailerCustomization` class that has a method to `customizeRegisterLogic:`.

3) We are your client so we will provide the logic code here for taxes and for coupons. We also provide a `generateTestData` method below to ensure you have implemented the whole `CashRegister` system with its custom logic correctly. To do so, create a `CashRegister` in your AppDelegate and `applyCoupons` and calculateTax` and see what you get back. The correct results can be found at the following link: JOE - I'VE SEEN YOU DO THIS ON A COUPLE OF LABS IN THE PAST; ONCE WE GET THIS WORKING, WE CAN ADD THE "RESULTS" IN SOMEWHERE SINCE WE WON'T YET HAVE TESTS.

####Tax Logic
```objc

NSNumber *taxAmount = @([[self netPrice:transaction.product] floatValue] * [cashRegister.store.state.taxRate floatValue]);  // JOE - WARNING THAT THIS MAY CREATE A RETAIN CYCLE BECAUSE OF CASHREGISTER. IS THIS A WEAKSELF SITUATION WE NEED TO IMPLEMENT? (CAN LOOK INTO THIS FURTHER ON MONDAY MORNING.)
        
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
```


####Coupon Logic
```objc
To be completed.
```


####Transaction Data Method
```objc
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

```

## Advanced
Read up on how to compile a static library in Objective-C, to ensure you know how to keep your end user from modifying your lovely code base! Commit before compiling.

## Notes

* Enums are used here to give numeric values more meaning. Therefore instead of using the number "1" to mean a product in the apparel category, we can use `ProductCategoryApparel` instead.

* Check out the "switch" statement. It takes the place of an "if" statement as a conditional.