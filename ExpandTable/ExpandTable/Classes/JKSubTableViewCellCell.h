//
//  JKSubTableViewCellCell.h
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InvitedList.h"

@interface JKSubTableViewCellCell : UITableViewCell {
    UIImageView *iconImage;
    UILabel *labelChild; // celula filha
    UILabel *labelDate; // celula filha de data
    UIImageView *selectionIndicatorImg;
}

@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UILabel *labelChild;
@property (nonatomic,strong) UILabel *labelDate;
@property (nonatomic,strong) UIImageView *selectionIndicatorImg;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (void)setupDisplay;
- (void)setCellForegroundColor:(UIColor *) foregroundColor;
- (void)setCellBackgroundColor:(UIColor *) backgroundColor;

@end
