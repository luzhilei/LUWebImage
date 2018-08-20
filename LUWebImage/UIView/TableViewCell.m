//
//  TableViewCell.m
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import "TableViewCell.h"
#import "WebViewController.h"
#import "UIView+CurrentVc.h"
#import "UIImageView+WebCache.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textView.delegate = self;
    self.textView.editable = false;
    self.textView.scrollEnabled = false;
    self.textView.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor blueColor]};
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;

}
-(void)setModel:(LUModel *)model{
    
    _model = model;
    self.titleLabel.text = model.title;
    
    
    NSMutableAttributedString * content = [[NSMutableAttributedString alloc] initWithString:model.content];
    for (ClickInfo *info in model.clickInfos) {
        [content addAttribute:NSLinkAttributeName value:info.url range:[model.content rangeOfString:info.str]];
    }
    
    self.textView.attributedText = content;
    
    [self.imgView lu_setImageWithURL:[NSURL URLWithString:model.imageURL] placeholderImage:[UIImage imageNamed:@"1"]];
    
    
    
}
-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction{
    if ([URL.scheme containsString:@"http"]) {
        WebViewController *vc = [[WebViewController alloc] init];
        vc.url = URL.absoluteString;
        [[self currentVc].navigationController pushViewController:vc animated:true];
        return false;
    }
    return true;
}


@end
