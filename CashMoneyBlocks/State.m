//
//  State.m
//  CashMoneyBlocks
//
//  Created by Zachary Drossman on 10/31/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "State.h"

@interface State ()

@end

@implementation State

-(NSNumber *)taxRate {
    if ([self.abbreviation isEqualToString:@"NY"]) {
        return @0.10;
    };
    
    return @0.07;
}

@end
