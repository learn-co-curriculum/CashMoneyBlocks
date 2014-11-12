//
//  State.h
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CashRegister;

@interface State : NSObject

@property (strong, nonatomic) NSNumber *taxRate;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *abbreviation;
@property (strong, nonatomic) CashRegister *cashRegister;

@end
