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


```


####Coupon Logic
```objc

 

```


####Transaction Data Method
```objc



```

## Advanced
Read up on how to compile a static library in Objective-C, to ensure you know how to keep your end user from modifying your lovely code base! Commit before compiling.

## Notes

* Enums are used here to give numeric values more meaning. Therefore instead of using the number "1" to mean a product in the apparel category, we can use `ProductCategoryApparel` instead. For more information, check out [this article](http://nshipster.com/ns_enum-ns_options/)) on the various ways to declare ENUM. (You can find our declaration of it in the `Product.h` file.)

* Check out the "switch" statements in our tax and coupon logic. They take the place of "if" statements as a conditional.

* In a real life scenario, we would likely have an array of products and their quantities as part of the `Transaction` object; but for today, we've chosen to simplify a bit for the sake of getting to the real point of this lab, which is blocks!

* In our contrived example, the tax gets applied to the items gross price (i.e. before the coupon discount gets applied). Feel free to try to get fancy and make them work together if you get this far!