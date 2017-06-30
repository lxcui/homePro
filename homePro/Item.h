//
//  Item.h
//  homePro
//
//  Created by Cui, Longxiang on 6/28/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic) NSDate *dateCreated;

- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)serialNumber
              valueInDollars:(int)valueInDollars NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithRandomValues;

@end
