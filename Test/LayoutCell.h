//
//  LayoutCell.h
//  Test
//
//  Created by B.H. Liu on 12-6-11.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef enum FrameType{
    FRAMEONE,       //40*40
    FRAMETWO,       //85*40
    FRAMETHREE,     //40*85
    FRAMEFOUR,      //85*85
    FRAMENINE       //130*130
}FRAMETYPE;

@interface LayoutCell : UITableViewCell
{
    int numberOfRows;
    NSMutableArray *pictures;
}

@property (nonatomic,retain) NSMutableArray *availableGrid;
@property (nonatomic,retain) NSMutableArray *resultGridsArray;

- (void)layoutWithWeightArray:(NSArray*)array;
- (CGFloat)heightForCell;

@end
