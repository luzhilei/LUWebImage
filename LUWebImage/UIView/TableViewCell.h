//
//  TableViewCell.h
//  LUWebImage
//
//  Created by Rango on 2018/8/13.
//  Copyright © 2018年 Rango. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rango/Rango.h>
@interface TableViewCell : UITableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic ,strong)LUModel *model;
@end
