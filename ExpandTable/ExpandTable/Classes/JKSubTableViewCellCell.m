//
//  JKSubTableViewCellCell.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "JKSubTableViewCellCell.h"

@implementation JKSubTableViewCellCell
@synthesize labelChild, labelDate, iconImage, selectionIndicatorImg;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [[self contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    if(!self)
        return self;
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [self.contentView addSubview:iconImage];
    
    self.selectionIndicatorImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:selectionIndicatorImg];
    
    [self configLabelChild];
    [self configLabelDate];
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    [self setupDisplay];
}

-(void) configLabelChild {
    
    //Config das labels filhas
    labelChild = [[UILabel alloc] initWithFrame:CGRectZero];
    labelChild.backgroundColor = [UIColor whiteColor];
    labelChild.textColor = [UIColor blackColor];
    labelChild.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:labelChild];
    
}

- (void) configLabelDate {
    
    labelDate = [[UILabel alloc] initWithFrame:CGRectZero];
    labelDate.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    labelDate.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:labelDate];
    
}

- (void) setupDisplay {
    
    CGRect contentRect = [self bounds];
    CGFloat contentAreaWidth = self.contentView.bounds.size.width;
    CGFloat contentAreaHeight = self.contentView.bounds.size.height;
    CGFloat checkMarkHeight = 0.0;
    CGFloat checkMarkWidth = 0.0;
    CGFloat iconHeight = 0.0; //  set this according to icon
    CGFloat iconWidth = 0.0;
    
    //Definindo o tamanho das minhas imagens
    if (self.iconImage.image) {
        iconWidth = MIN(contentAreaWidth, self.iconImage.image.size.width);
        iconHeight = MIN(contentAreaHeight, self.iconImage.image.size.height);
    }
    if (self.selectionIndicatorImg.image) {
        checkMarkWidth = MIN(contentAreaWidth, self.selectionIndicatorImg.image.size.width);
        checkMarkHeight = MIN(contentAreaHeight, self.selectionIndicatorImg.image.size.height);
    }
    
    CGFloat sidePadding = 22.0;
    CGFloat icon2LabelPadding = 6.0;
    CGFloat checkMarkPadding = 16.0;
    [self.contentView setAutoresizesSubviews:YES];
    
    //Aqui fica a posição da imagem que esta a esquerda da celula
    //self.iconImage.frame = CGRectMake(sidePadding, (contentAreaHeight - iconHeight)/2, iconWidth, iconHeight);
    
    //Definindo posição fonte e tamanho
    CGFloat XOffset = iconWidth + sidePadding + icon2LabelPadding;
    CGFloat labelWidth = contentAreaWidth - XOffset - checkMarkWidth - checkMarkPadding;
    
    labelChild.frame = CGRectMake(XOffset, 0, 185, contentAreaHeight);
    labelChild.lineBreakMode = NSLineBreakByTruncatingTail;
    labelDate.frame = CGRectMake(XOffset - 5, 0, labelWidth, contentAreaHeight);
    
    labelChild.font = [UIFont fontWithName:@"OfficinaSerifStd-Bold" size:12];
    labelDate.font = [UIFont fontWithName:@"ITC Officina Serif Std" size:10];
    
    self.selectionIndicatorImg.frame = CGRectMake(contentAreaWidth - checkMarkWidth - checkMarkPadding,
                                                      (contentRect.size.height/2)-(checkMarkHeight/2),
                                                      checkMarkWidth,
                                                      checkMarkHeight);

}

- (void)setCellForegroundColor:(UIColor *) foregroundColor {
    labelChild.textColor = foregroundColor;
}

- (void)setCellBackgroundColor:(UIColor *) backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}


@end
