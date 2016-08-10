//
//  JKParentTableViewCell.h
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InviteDetails.h"

@interface JKParentTableViewCell : UITableViewCell {
    UIImageView *iconImage;
    UILabel *labelFather;
    UILabel *labelYear;
    UILabel *labelQtFriends;
    UILabel *labelTotalFriends;
    UIImageView *selectionIndicatorImgView;
    NSInteger parentIndex;
}

@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UILabel *labelFather;
@property (nonatomic, strong) UILabel *labelYear;
@property (nonatomic, strong) UILabel *labelQtFriends;
@property (nonatomic, strong) UILabel *labelTotalFriends;
@property (nonatomic,strong) UIImage *selectionIndicatorImg;
@property (nonatomic,strong) UIImageView *selectionIndicatorImgView;
@property (nonatomic) NSInteger parentIndex;
@property InviteDetails *loadedInviteds;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (void)setupDisplay;
- (void)rotateIconToExpanded;
- (void)rotateIconToCollapsed;
- (void)selectionIndicatorState:(BOOL) visible;
- (void)setCellForegroundColor:(UIColor *) foregroundColor;
- (void)setCellBackgroundColor:(UIColor *) backgroundColor;

@end
