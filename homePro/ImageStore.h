//
//  ImageStore.h
//  homePro
//
//  Created by Longxiang Cui on 7/3/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageStore : NSObject

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
