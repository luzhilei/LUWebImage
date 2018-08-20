//
//  LuWebImageOperation.m
//  LUWebImage
//
//  Created by Rango on 2018/8/16.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "LuWebImageOperation.h"
#import "NSString+DiskPath.h"
@implementation LuWebImageOperation
+(instancetype)webImageOperationWith:(NSURL *)url completion:(void(^)(UIImage *image))completion{
    LuWebImageOperation *imageoperation = [[LuWebImageOperation alloc] init];
    imageoperation.url = url;
    imageoperation.completion = completion;
    return imageoperation;
}
//操作加入队列后会自动执行该方法
-(void)main{
    @autoreleasepool{
        if (self.isCancelled) {
            return;
        }
        NSData *data = [NSData dataWithContentsOfURL:self.url];
        if (self.isCancelled) {
            return;
        }
        if (data != nil) {
            //写入沙盒
            [data writeToFile:[[self.url absoluteString] appendCachePath] atomically:true];
        }
        if (self.isCancelled) {
            return;
        }
        if (self.completion && data != nil) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.completion([UIImage imageWithData:data]);
            }];
        }
    }
}

@end
