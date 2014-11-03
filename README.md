---
tags: blocks
languages: objc
---

# CashMoneyBlocks

## Instructions

**You are highly encouraged to read through the entire readme before attempting to do this lab!**

You are the lead software engineer for a manufacturer that makes the cash register hardware. Clients generally want to be able to program their cash registers after the fact to use their own receipt formats and program items into the register such that the pricing rules can change periodically (e.g. couponing, taxes, etc.)

As the manufacturer you do NOT want the end user to modify the cash register code, so you decide you are going to give them blocks as arguments for the methods that build the format of each transaction on the receipt so that they do not have to change anything in the register library itself.

To speed this up a little, your junior developer has provided you with a basic `Product`, `Transaction`, `Store` and `State` class, complete with properties and initializers where needed.

As senior developer, you have to do the heavy lifting of the blocks. Ha. Ha. Ha.

Here is what you will need:

1) A `CashRegister` class with four properties including:

@property (strong, nonatomic) Store *store;
@property (strong, nonatomic) NSArray *transactions;

as well as two block properties. Since this is a lab on blocks, we'll let you figure out how to write those up. You'll want one for `couponLogic` and another for `taxLogic`.

This class will also have two methods called `applyCoupons` and `calculateTax`. They will both return an NSNumber for the total dollars saved by using coupons and the total amount of tax for all transactions on the `CashRegister` respectively.

2) A `RetailerCustomization` class that has a method to `customizeRegisterLogic:` (where the user of the `CashRegister` will implement the `taxLogic` and `couponLogic` block properties that you declared in `CashRegister`).

3) We will serve as the "user" so we have provided the logic code to complete the `taxLogic` and `couponLogic` definitions below, that you can cut and paste in. We also provide a `generateTestData` method below to ensure you have implemented the whole `CashRegister` system with its custom logic correctly. 

Finally, to test all of your logic, create a `CashRegister` (and related necessary objects) in your AppDelegate and `applyCoupons` and `calculateTax` methods and see what you get back in values from the register.  If you've done it correctly, you will be given the total savings from coupons and the total tax collected of all transactions from the store. (Feel free to just NSLog the results since there are no tests in this lab.)

Note: The following tax logic code will cause a retain cycle. Read up on retain cycles with the links below to learn more. However, if you don't understand, just leave the code as is.

* [Capturing My(self)](http://blackpixel.com/blog/2014/03/capturing-myself.html)
* [Objective-C Block Caveat](http://albertodebortoli.github.io/blog/2013/08/03/objective-c-blocks-caveat/)
* [Debugging Retain Cycles](http://www.reigndesign.com/blog/debugging-retain-cycles-in-objective-c-four-likely-culprits/)

####Tax Logic
```objc
        NSNumber *taxAmount = @([transaction.product.price floatValue] * [cashRegister.store.state.taxRate floatValue]);
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        switch (transaction.product.productCategory) {
            case ProductCategoryGrocery:
                
                return @0;
                
            case ProductCategoryApparel:
                
                if ([cashRegister.store.state.abbreviation isEqualToString:@"NY"] &&  [transaction.product.price floatValue]  < 100)
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

```


####Coupon Logic
```objc
        if ([transaction.fullTransactionValue floatValue] > 10.0 && transaction.product.productCategory != ProductCategoryEducation)
        {
            return (@([transaction.fullTransactionValue floatValue] * .10));
        }
        else
            return @0;
```


####Transaction Data Method
```objc
- (NSArray *)generateTransactionData {
    
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

    NSArray *transactions = @[transactionOne, transactionTwo, transactionThree, transactionFour, transactionFive, transactionSix];
    
    return transactions;
    
}
```

## Advanced
Read up on how to compile a static library in Objective-C, to ensure you know how to keep your end user from modifying your lovely code base! Commit before compiling.

## Notes

* Enums are used here to give numeric values more meaning. Therefore instead of using the number "1" to mean a product in the apparel category, we can use `ProductCategoryApparel` instead. For more information, check out [this article](http://nshipster.com/ns_enum-ns_options/)) on the various ways to declare ENUM. (You can find our declaration of it in the `Product.h` file.)

* Check out the "switch" statements in our tax and coupon logic. They take the place of "if" statements as a conditional.

* In a real life scenario, we would likely have an array of products and their quantities as part of the `Transaction` object; but for today, we've chosen to simplify a bit for the sake of getting to the real point of this lab, which is blocks!

* In our contrived example, the tax gets applied to the items gross price (i.e. before the coupon discount gets applied). Feel free to try to get fancy and make them work together if you get this far!