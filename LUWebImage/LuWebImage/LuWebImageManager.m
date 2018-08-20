//
//  LuWebImageManager.m
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "LuWebImageManager.h"

#import "LuWebImageOperation.h"

#import "NSString+DiskPath.h"



@implementation LuWebImageManager
+(LuWebImageManager *)sharedManager{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}
#pragma mark - lazy
-(NSOperationQueue *)downloadQueue{
    if (_downloadQueue == nil) {
        _downloadQueue = [[NSOperationQueue alloc] init];
    }
    return _downloadQueue;
}
-(NSMutableDictionary *)downloadQueueCache{
    if (_downloadQueueCache == nil) {
        _downloadQueueCache = [[NSMutableDictionary alloc] init];
    }
    return _downloadQueueCache;
}
-(NSMutableDictionary *)imageCache{
    if (_imageCache == nil) {
        _imageCache = [[NSMutableDictionary alloc] init];
    }
    return _imageCache;
}
- (NSMutableArray *)urlBlackList {
    if (_urlBlackList == nil) {
        _urlBlackList = [[NSMutableArray alloc] init];
    }
    return _urlBlackList;
}

-(void)downloadImage:(NSURL *)url placeholderImage:(UIImage *)placeholderImage completion:(void(^)(UIImage *image))completion{
    
    
    //先检查缓存
    NSString *urlStr = [url absoluteString];
    //缓存是否有图片
    if (self.imageCache[urlStr] != nil) {
        //返回缓存
        if(completion != nil){
            completion(self.imageCache[urlStr]);
        }
        return;
    }

    UIImage *image = [UIImage imageWithContentsOfFile:[urlStr appendCachePath]];

    //沙盒是否有图片
    if (image != nil) {
         completion(image);
        [self.imageCache setObject:image forKey:urlStr];

        return ;
    }
    //黑名单
    if ([self.urlBlackList containsObject:urlStr]) {
        completion(placeholderImage);
        return;
    }
    
    
    //缓冲池中是否存在下载操作，防止重复下载
    if (self.downloadQueueCache[urlStr] != nil) {
        
        return;
    }
    
    LuWebImageOperation *downloadOperation = [LuWebImageOperation webImageOperationWith:url completion:^(UIImage *image) {
        
        //下载完成从缓冲池移除
        NSString * str = [url absoluteString];
        [self.downloadQueueCache removeObjectForKey:str];
    
        
        if (image != nil) {
            // 添加到缓存
            [self.imageCache setObject:image forKey:str];
            //返回 image
            if (completion != nil) {
                completion(image);
            }
        }else{
            //image 不存在
            NSLog(@"image 不存在");
            //黑名单没有 就添加
            if (![self.urlBlackList containsObject:str]) {
                [self.urlBlackList addObject:str];
            }
            completion(placeholderImage);
        }
       
        
        
    }];
  
    //下载操作添加缓冲池
    [self.downloadQueueCache setObject:downloadOperation forKey:urlStr];
    //添加到队列 ， 开始异步下载
    [self.downloadQueue addOperation:downloadOperation];
    
   
}

@end
