//
//  WebViewController.m
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebView *webVc = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSLog(@"%@",self.url);
    [webVc loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.url]]]];

    [self.view addSubview:webVc];
}



@end
