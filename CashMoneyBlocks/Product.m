//
//  Product.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/30/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "Product.h"

@interface Product ()

@end

@implementation Product

- (instancetype)init {
    return [self initWithProductDescription:@"" UPC:@"" Price:@0.00 Size:@0 Measure:@"" andProductCategory:ProductCategoryUndefined];
}

- (instancetype)initWithProductDescription:(NSString *)productDescription UPC:(NSString *)upc Price:(NSNumber *)price Size:(NSNumber *)size Measure:(NSString *)measure andProductCategory:(ProductCategory)productCategory{
    
    self = [super init];
    
    if (self) {
        _productDescription = productDescription;
        _UPC = upc;
        _price = price;
        _size = size;
        _measure = measure;
        _productCategory = productCategory;
    }
    
    return self;
    
}

@end
