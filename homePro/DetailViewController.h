//
//  DetailViewController.h
//  homePro
//
//  Created by Longxiang Cui on 6/29/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;
@class ImageStore;

@interface DetailViewController : UIViewController

@property (nonatomic) Item *item;
@property (nonatomic) ImageStore *imageStore;

@end
