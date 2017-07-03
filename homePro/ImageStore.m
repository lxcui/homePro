//
//  ImageStore.m
//  homePro
//
//  Created by Longxiang Cui on 7/3/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import "ImageStore.h"
#import <UIKit/UIKit.h>
@interface ImageStore ()
@property (nonatomic) NSCache *cache;
@end


@implementation ImageStore

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [NSCache new];
    }
    return self;
}
// MARK: - Image Management
- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    [self.cache setObject:image forKey:key];
}
- (UIImage *)imageForKey:(NSString *)key {
    return [self.cache objectForKey:key];
}
- (void)deleteImageForKey:(NSString *)key {
    [self.cache removeObjectForKey:key];
}

@end
