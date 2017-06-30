//
//  ItemsViewController.h
//  homePro
//
//  Created by Cui, Longxiang on 6/28/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemStore;

@interface ItemsViewController : UITableViewController
@property (nonatomic) ItemStore *itemStore;
@end
