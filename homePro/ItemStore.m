//
//  ItemStore.m
//  homePro
//
//  Created by Cui, Longxiang on 6/28/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@interface ItemStore ()
@property (nonatomic) NSMutableArray *items;
@end

@implementation ItemStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
    }
    return self;
}

// MARK: - Item Management
- (NSArray *)allItems {
    return [self.items copy];
}

- (Item *)createItem {
    Item *newItem = [[Item alloc] initWithRandomValues];
    [self.items addObject:newItem];
    return newItem;
}

- (void)removeItem:(Item *)item {
    [self.items removeObject:item];
}

- (void)moveItemAtIndex:(NSUInteger)oldIndex
                toIndex:(NSUInteger)newIndex {
    if (oldIndex == newIndex) {
        return; }
    // Get a reference to the object being removed so it can be re-inserted
    Item *item = self.items[oldIndex];
    // Remove it from the array
    [self.items removeObjectAtIndex:oldIndex];
    // Insert it at the new index
    [self.items insertObject:item atIndex:newIndex];
}

@end
