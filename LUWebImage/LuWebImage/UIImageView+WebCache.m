//
//  UIImageView+WebCache.m
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "LuWebImageManager.h"

@implementation UIImageView (WebCache)
-(void)lu_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage{
    if (![url isKindOfClass:NSURL.class]) {
        
        url = nil;
        self.image = placeholderImage;
        return;
    }
   
    __weak typeof (self) weakSelf = self;
    [[LuWebImageManager sharedManager] downloadImage:url placeholderImage:placeholderImage completion:^(UIImage *image) {
        weakSelf.image = image;
    }];
    
        
        
    
}

@end
