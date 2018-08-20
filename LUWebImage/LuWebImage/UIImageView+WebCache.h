//
//  UIImageView+WebCache.h
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebCache)
-(void)lu_setImageWithURL:(NSURL *)url  placeholderImage:(UIImage *)placeholderImage;
@end
