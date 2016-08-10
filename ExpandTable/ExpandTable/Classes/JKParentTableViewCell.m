//
//  JKParentTableViewCell.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "JKParentTableViewCell.h"
#import "InvitationGroupList.h"

@implementation JKParentTableViewCell

@synthesize labelFather, labelYear, labelQtFriends, iconImage,labelTotalFriends,selectionIndicatorImgView, parentIndex, selectionIndicatorImg;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier; {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [[self contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    if(!self) {
        return self;
    }
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    //Imagem do lado esquerdo das celulas pai
//    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [self.contentView addSubview: iconImage];
    
    [self configLabelFather];
    [self configLabelQtFriends];
    [self configLabelYear];
    [self configLabelTotalFriends];
    [self configSeparatorView];

    self.selectionIndicatorImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //[self.selectionIndicatorImgView setContentMode:UIViewContentModeCenter];
    [self.contentView addSubview:selectionIndicatorImgView];
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    [self setupDisplay];
}


//Config das labels Total de amigos
- (void) configLabelTotalFriends {
    
    labelTotalFriends = [[UILabel alloc] initWithFrame:CGRectZero];
    labelTotalFriends.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    labelTotalFriends.font = [UIFont fontWithName:@"ITC Officina Serif Std" size:14];
    labelTotalFriends.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:labelTotalFriends];
    
}

//Configura a minha linha de separação de celulas pais
-(void) configSeparatorView {
    UIImageView *sepatorView = [[UIImageView alloc] initWithFrame: CGRectMake(0, labelFather.frame.origin.y, 500, 7)];
    sepatorView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:sepatorView];
    
}

//Config das labels qtFriends
- (void) configLabelQtFriends {
    
    labelQtFriends = [[UILabel alloc] initWithFrame:CGRectZero];
    labelQtFriends.font = [UIFont fontWithName:@"OfficinaSerifStd-Bold" size:14];
    labelQtFriends.textColor = [UIColor colorWithRed:79/255.0 green:14/255.0 blue:111/255.0 alpha:1];
    labelQtFriends.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:labelQtFriends];
    
}

//Config label ano
- (void) configLabelYear {
    
    labelYear = [[UILabel alloc] initWithFrame:CGRectZero];
    labelYear.textColor = [UIColor colorWithRed:79/255.0 green:14/255.0 blue:111/255.0 alpha:1];
    labelYear.font = [UIFont fontWithName:@"ITC Officina Serif Std" size:14];
    labelYear.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:labelYear];
    
}

//Config das labels pais
- (void) configLabelFather {

    labelFather = [[UILabel alloc] initWithFrame:CGRectZero];
//    labelFather.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];; /// Cor do background labels pais
    labelFather.backgroundColor = [UIColor clearColor];
    labelFather.textColor = [UIColor colorWithRed:79/255.0 green:14/255.0 blue:111/255.0 alpha:1];
    labelFather.font = [UIFont fontWithName:@"OfficinaSerifStd-Bold" size:14];
    labelFather.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:labelFather];
    
}

//Configuro as imagens da celula pai
- (void)setupDisplay {
    CGRect contentRect = [self bounds];
    CGFloat contentAreaWidth = self.contentView.bounds.size.width;
    CGFloat contentAreaHeight = self.contentView.bounds.size.height;
    CGFloat checkMarkHeight = 0.0;
    CGFloat checkMarkWidth = 0.0;
    CGFloat iconHeight = 0.0; //  set this according to icon
    CGFloat iconWidth = 0.0;
    
    if (self.iconImage.image) {
        iconWidth = MIN(contentAreaWidth, self.iconImage.image.size.width);
        iconHeight = MIN(contentAreaHeight, self.iconImage.image.size.height);
    }
    if (self.selectionIndicatorImgView.image) {
        checkMarkWidth = MIN(contentAreaWidth, self.selectionIndicatorImgView.image.size.width - 10);
        checkMarkHeight = MIN(contentAreaHeight, self.selectionIndicatorImgView.image.size.height - 10);
    }
    
    CGFloat sidePadding = 6.0;
    CGFloat icon2LabelPadding = 6.0;
    CGFloat checkMarkPadding = 16.0;
    [self.contentView setAutoresizesSubviews:YES];
    
//    self.iconImage.frame = CGRectMake(sidePadding, (contentAreaHeight - iconHeight)/2, iconWidth, iconHeight);
    CGFloat XOffset = iconWidth + sidePadding + icon2LabelPadding;
    CGFloat labelWidth = contentAreaWidth - XOffset - checkMarkWidth - checkMarkPadding;
    
    //Mexi aqui, modifico a posição e o tamanho das minhas labels
    labelFather.frame = CGRectMake(XOffset + 15, 5 , 30, contentAreaHeight);
    labelYear.frame = CGRectMake(XOffset + 40, 5, labelWidth, contentAreaHeight);
    
    labelQtFriends.frame = CGRectMake(XOffset - 50, 5, labelWidth, contentAreaHeight);
    
    if (labelTotalFriends.text.length >= 4) {
        labelTotalFriends.frame = CGRectMake(XOffset - 60, 5, labelWidth + 40, contentAreaHeight);
    } else {
        labelTotalFriends.frame = CGRectMake(XOffset - 68, 5, labelWidth + 40, contentAreaHeight);
    }
    
    self.selectionIndicatorImgView.frame = CGRectMake(contentAreaWidth - checkMarkWidth - checkMarkPadding - 10,
                                                 (contentRect.size.height/2)-(checkMarkHeight/2),
                                                 checkMarkWidth + 10,
                                                 checkMarkHeight + 10);
    // Set image to down when is first element
    if(parentIndex == 0){
        [self rotateIconToExpanded];
    }
    
}

- (void)rotateIconToExpanded {
    [UIView beginAnimations:@"rotateDisclosure" context:nil];
    [UIView setAnimationDuration:0.2];
    selectionIndicatorImgView.transform = CGAffineTransformMakeRotation(M_PI * -0.5);
    [UIView commitAnimations];
}

- (void)rotateIconToCollapsed {
    [UIView beginAnimations:@"rotateDisclosure" context:nil];
    [UIView setAnimationDuration:0.2];
    selectionIndicatorImgView.transform = CGAffineTransformMakeRotation(M_PI * 0);
    [UIView commitAnimations];
}

//Verifica o estado da imagem na celula
- (void)selectionIndicatorState:(BOOL) visible {
        
    if (!self.selectionIndicatorImg) {
        self.selectionIndicatorImg = [UIImage imageNamed:@"arrow_purple_left"]; //Coloca imagem na ponta da celulas pai
    }
    
    self.selectionIndicatorImgView.image = self.selectionIndicatorImg;  // probably better to init this elsewhere
    
    if (visible) {
        self.selectionIndicatorImgView.hidden = NO;
    }
}

- (void)setCellForegroundColor:(UIColor *) foregroundColor {
    self.labelFather.textColor = foregroundColor;
}

- (void)setCellBackgroundColor:(UIColor *) backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

@end
