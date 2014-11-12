//
//  Product.h
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/30/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ProductCategory) {
    ProductCategoryUndefined = 0,
    ProductCategoryApparel = 1,
    ProductCategoryGrocery = 2,
    ProductCategoryEducation = 3,
    ProductCategoryLuxuryItem = 4,
    ProductCategoryOther = 5,
};

@interface Product : NSObject {
    NSNumber *_whatever;
NSNumber *_size;
}
@property (nonatomic, strong) NSString *productDescription;
@property (nonatomic, strong) NSString *UPC;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSString *measure;
@property (nonatomic) ProductCategory productCategory;

- (instancetype)init;


//Designated initializer
- (instancetype)initWithProductDescription:(NSString *)productDescription UPC:(NSString *)upc Price:(NSNumber *)price Size:(NSNumber *)size Measure:(NSString *)measure andProductCategory:(ProductCategory)productCategory;

@end
