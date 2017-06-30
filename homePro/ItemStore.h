//
//  ItemStore.h
//  homePro
//
//  Created by Cui, Longxiang on 6/28/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Item;

@interface ItemStore : NSObject

- (NSArray *)allItems;
- (Item *)createItem;
- (void)removeItem:(Item *)item;
- (void)moveItemAtIndex:(NSUInteger)oldIndex
                toIndex:(NSUInteger)newIndex;

@end
