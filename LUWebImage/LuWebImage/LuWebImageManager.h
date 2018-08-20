//
//  LuWebImageManager.h
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LuWebImageManager : NSObject
@property (nonatomic ,strong)NSOperationQueue *downloadQueue; //下载队列
@property (nonatomic ,strong)NSMutableDictionary *downloadQueueCache;//下载队列缓存
@property (nonatomic ,strong)NSMutableDictionary *imageCache;//图片缓存
@property (nonatomic, strong) NSMutableArray *urlBlackList; // 图片黑名单
+(LuWebImageManager *)sharedManager;

-(void)downloadImage:(NSURL *)url placeholderImage:(UIImage *)placeholderImage completion:(void(^)(UIImage *image))completion;

@end
