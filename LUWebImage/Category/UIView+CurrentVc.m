//
//  UIView+CurrentVc.m
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "UIView+CurrentVc.h"

@implementation UIView (CurrentVc)
-(UIViewController *)currentVc{
    UIResponder *next = [self nextResponder];
    do{
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
        return nil;
}
@end
