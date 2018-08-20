//
//  LuWebImageOperation.h
//  LUWebImage
//
//  Created by Rango on 2018/8/16.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LuWebImageOperation : NSOperation
@property (nonatomic ,strong)NSURL *url;// 图片url
@property (nonatomic ,copy)void(^completion)(UIImage *image); //下载完成回调 image
+(instancetype)webImageOperationWith:(NSURL *)url completion:(void(^)(UIImage *image))completion;
@end
