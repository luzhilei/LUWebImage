//
//  LUModel.h
//  Rango
//
//  Created by 四川衣衣相伴Lu on 2018/8/13.
//  Copyright © 2018年 四川衣衣相伴网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ClickInfo;
@interface LUModel : NSObject
@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *imageURL;
@property (nonatomic ,strong)NSString *content;
@property (nonatomic ,strong)NSArray *clickInfos;
+(NSArray *)getAllData;
@end

@interface ClickInfo : NSObject;
@property (nonatomic ,strong)NSString * str;
@property (nonatomic ,strong)NSString *url;
@end
