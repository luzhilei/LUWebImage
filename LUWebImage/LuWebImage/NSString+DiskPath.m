//
//  NSString+DiskPath.m
//  LUWebImage
//
//  Created by Rango on 2018/8/16.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "NSString+DiskPath.h"

@implementation NSString (DiskPath)
- (NSString *)appendCachePath {
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}
@end
