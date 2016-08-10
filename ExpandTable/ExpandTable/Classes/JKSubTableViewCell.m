//
//  JKSubTableViewCell.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/20/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "JKSubTableViewCell.h"
#import "JKSubTableViewCellCell.h"

@implementation JKSubTableViewCell

@synthesize insideTableView, selectionIndicatorImg;

#define HEIGHT_FOR_CELL 44.0

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //TableView das celulas filhas
        self.insideTableView = [[UITableView alloc] init];
        insideTableView.dataSource = self;
        insideTableView.delegate = self;
        
        self.insideTableView.separatorColor = [UIColor whiteColor];
        
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [[self contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self.insideTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        insideTableView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
        fgColor = [UIColor darkTextColor];
        bgColor = [UIColor whiteColor]; // Altera a cor das pontas das celulas filhas
        font = [UIFont systemFontOfSize:16.0];
        insideTableView.backgroundColor = [UIColor clearColor];
        insideTableView.scrollEnabled = NO;
        [self.contentView addSubview:self.insideTableView];
        
    }
    return self;
}

- (void) setDelimeterClearColor {
    insideTableView.separatorColor = [UIColor whiteColor];
}

- (id) getDelegate {
    return delegate;
}

// TODO combine set delegate and parentIndex into one method for better safety
- (void) setDelegate:(id<JKSubTableViewCellDelegate>)deleg {
    delegate = deleg;
    NSInteger numberOfChild = [delegate numberOfChildrenUnderParentIndex:self.parentIndex];
    insideTableView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, HEIGHT_FOR_CELL * numberOfChild);
}

- (void)setSelected:(BOOL)selected qanimated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(UIColor *) getSubTableForegroundColor {
    return fgColor;
}

-(void) setSubTableForegroundColor:(UIColor *)p_fgColor {
    fgColor = p_fgColor;
}

-(UIColor *) getSubTableBackgroundColor {
    return bgColor;
}

-(void) setSubTableBackgroundColor:(UIColor *)p_bgColor {
    bgColor = p_bgColor;
}

-(UIFont *) getSubTableFont {
    return font;
}

-(void) setSubTableFont:(UIFont *) p_font  {
    font = p_font;
}

- (UIImage *) selectionIndicatorImgOrDefault {
//    if (!self.selectionIndicatorImg) {
//        self.selectionIndicatorImg = [UIImage imageNamed:@""]; // Coloco imagem nas filhas
//    }
    return self.selectionIndicatorImg;
}

- (void) reload {
    [self.insideTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.delegate numberOfChildrenUnderParentIndex:self.parentIndex];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SubTableViewCellCell_Reuse_Id";
    
    JKSubTableViewCellCell *cell = (JKSubTableViewCellCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[JKSubTableViewCellCell alloc] initWithReuseIdentifier:CellIdentifier];
    } else {
//        NSLog(@"reusing existing JKSubTableViewCellCell");
    }
    
    NSInteger row = [indexPath row];
    cell.labelChild.text = [self.delegate labelForChildIndex:row underParentIndex: self.parentIndex];
    cell.labelDate.text = [self.delegate labelDateAndHourIndex:row underParentIndex:self.parentIndex];
    cell.iconImage.image = [self.delegate iconForChildIndex:row underParentIndex: self.parentIndex];
    cell.selectionIndicatorImg.image = [self selectionIndicatorImgOrDefault];
    
    // Setar the last delimiter to clear color
//    NSLog(@"%ld", (long)[self.delegate numberOfChildrenUnderParentIndex:self.parentIndex]);
    
    if(row != [self.delegate numberOfChildrenUnderParentIndex:self.parentIndex] - 1){
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44.0, [UIScreen mainScreen].bounds.size.width, 1)];
        separatorLineView.backgroundColor = [UIColor colorWithRed:99.0/255.0 green:32.0/255.0 blue:130.0/255.0 alpha:1];
        [cell.contentView addSubview:separatorLineView];
    }
    
//    [cell setCellBackgroundColor:bgColor]; Mexi aqui, seta a cor de fundo em todas as celulas
    [cell setCellForegroundColor:fgColor];
    [cell.labelChild setFont:font];
    [cell.labelDate setFont:font];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HEIGHT_FOR_CELL;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // must be implemented by concrete subclasses
}

@end
