//
//  LayoutCell.m
//  Test
//
//  Created by B.H. Liu on 12-6-11.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//

#import "LayoutCell.h"

#define MAXVIEWHEIGHT 250
#define MAXFRAMEHEIGHT 130
#define PADDING 5

#define FRAMEMAXWIDTH 130
#define FRAMEMINWIDTH 40

//one row contains 7 the-smallest-cells
#define BASICGRIDNUMBER 7   

@implementation LayoutCell

@synthesize availableGrid = _availableGrid;
@synthesize resultGridsArray=_resultGridsArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.availableGrid = [NSMutableArray array];
        self.resultGridsArray = [NSMutableArray array];
        
        numberOfRows = 0;
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.availableGrid = [NSMutableArray array];
        self.resultGridsArray = [NSMutableArray array];
        
        numberOfRows = 0;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (CGSize)sizeForType:(FRAMETYPE)type
{
    switch (type) 
    {
        case FRAMEONE:
            return CGSizeMake(40, 40);
            break;
        case FRAMETWO:
            return CGSizeMake(85, 40);
            break;
        case FRAMETHREE:
            return CGSizeMake(40, 85);
            break;
        case FRAMEFOUR:
            return CGSizeMake(85, 85);
            break;
        case FRAMENINE:
            return CGSizeMake(130, 130);
            break;
        default:
            break;
    }
}

- (NSArray*)arrayWillFormRect:(int)weight
{
    if (self.availableGrid.count < weight) return [NSArray array];
    
    if (weight == 1) 
    {
        if (self.availableGrid.count !=0)
        {
            return [self.availableGrid subarrayWithRange:NSMakeRange(0, 1)];
        }
    }
    if (weight == 2) 
    {
        if (self.availableGrid.count < 2) return [NSArray array];
        for (int i = 0 ; i < self.availableGrid.count; i ++)
        {
            if(i == self.availableGrid.count -1) return [NSArray array];
                
            NSMutableArray *resultArray = [NSMutableArray array];
            for (int j = 0 ; j < self.availableGrid.count; j ++)
            {                
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row] + 1)
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section]+1 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row])
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([resultArray count] == 1) 
                {
                    [resultArray insertObject:[self.availableGrid objectAtIndex:i] atIndex:0];
                    return resultArray;
                }
            }
//            if ([resultArray count] == 1) 
//            {
//                [resultArray insertObject:[self.availableGrid objectAtIndex:i] atIndex:0];
//                return resultArray;
//            }
            
        }
        return [NSArray array]; 
        
    }
    else if (weight == 4)
    {
        if (self.availableGrid.count < 4) return [NSArray array];
        for (int i = 0 ; i < self.availableGrid.count; i ++)
        {
            if (i == self.availableGrid.count - 3) return [NSArray array];
            
            NSMutableArray *resultArray = [NSMutableArray array];
            for (int j = 0 ; j < self.availableGrid.count; j ++)
            {
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row] + 1)
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section]+1 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row])
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section]+1 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row]+1)
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([resultArray count] == 3) 
                {
                    [resultArray insertObject:[self.availableGrid objectAtIndex:i] atIndex:0];
                    return resultArray;
                }
            }
//            if ([resultArray count] == 3) 
//            {
//                [resultArray insertObject:[self.availableGrid objectAtIndex:i] atIndex:0];
//                return resultArray;
//            }
            
        }
        return [NSArray array];
        
    }
    else if (weight == 9)
    {
        if (self.availableGrid.count < 9) return [NSArray array];
        for (int i = 0 ; i < self.availableGrid.count; i ++)
        {
            if (i == self.availableGrid.count - 8) return [NSArray array];

            NSMutableArray *resultArray = [NSMutableArray array];
            for (int j = 0 ; j < self.availableGrid.count; j ++)
            {
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row] + 1)
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row] + 2)
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] +1 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row])
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] +2 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row]) 
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] +1 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row]+1) 
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] +2 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row]+1) 
                {
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] +1 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row]+2) 
                {

                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([(NSIndexPath*)[self.availableGrid objectAtIndex:j]section] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] section] +2 && [(NSIndexPath*)[self.availableGrid objectAtIndex:j]row] == [(NSIndexPath*)[self.availableGrid objectAtIndex:i] row]+2) 
                {
                    
                    [resultArray addObject:[self.availableGrid objectAtIndex:j]];
                }
                if ([resultArray count] == 8) 
                {
                    [resultArray insertObject:[self.availableGrid objectAtIndex:i] atIndex:0];
                    return resultArray;
                }
            }
//            if ([resultArray count] == 8) 
//            {
//               [resultArray insertObject:[self.availableGrid objectAtIndex:i] atIndex:0];
//                return resultArray;
//            }
        
            return [NSArray array];
            
        }
        
    }
    
    return [NSArray array];  // empty array: no available space for this weight
}

- (void)dealWithSpace:(NSDictionary*)picture 
{
    int weight = [[picture objectForKey:@"weight"] intValue];  //weight can't be 1 or 2, must be larger number like 4 or 9
    while (![self arrayWillFormRect:weight]||[self arrayWillFormRect:weight].count == 0) 
    {
        for (NSIndexPath *indexpath in [[self.resultGridsArray lastObject]objectForKey:@"grids"])
        {
            [self.availableGrid insertObject:indexpath atIndex:0];
        }
        
        //should remove the view for the last object in resultGridsArray
        int tag = [(NSIndexPath*)[[[self.resultGridsArray lastObject]objectForKey:@"grids"] objectAtIndex:0] section]*BASICGRIDNUMBER+[(NSIndexPath*)[[[self.resultGridsArray lastObject]objectForKey:@"grids"] objectAtIndex:0] row];
        [[self viewWithTag:tag] removeFromSuperview];
        
        [self.resultGridsArray removeLastObject];  //release the last used grids into availabe pool
        
        [pictures insertObject:[NSDictionary dictionaryWithObjectsAndKeys:[[self.resultGridsArray lastObject]objectForKey:@"weight"], @"weight",[[self.resultGridsArray lastObject]objectForKey:@"image"],@"image",nil] atIndex:0]; //insert the picture back into not-layout-yet pool
    }
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:[self frameFromGrids:[self arrayWillFormRect:weight]]];
    view.image = [UIImage imageNamed:[picture objectForKey:@"image"]];
    [self addSubview:view];
    view.tag = [(NSIndexPath*)[[self arrayWillFormRect:weight]objectAtIndex:0] section]*BASICGRIDNUMBER + [(NSIndexPath*)[[self arrayWillFormRect:weight]objectAtIndex:0] row];
    
    [self.resultGridsArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self arrayWillFormRect:weight],@"grids",[NSString stringWithFormat:@"%d",weight],@"weight",[picture objectForKey:@"image"],@"image", nil]];
    
    [self.availableGrid removeObjectsInArray:[self arrayWillFormRect:weight]];
    [pictures removeObject:picture];
    
}

- (CGRect)frameFromGrids:(NSArray*)grids
{
    NSIndexPath *first = [grids objectAtIndex:0];
    CGFloat x = first.row * (FRAMEMINWIDTH+PADDING) + PADDING;
    CGFloat y = first.section * (FRAMEMINWIDTH+PADDING);
    CGFloat width = FRAMEMINWIDTH * (int)sqrt(grids.count) + PADDING * ((int)sqrt(grids.count)-1);
    CGFloat height = width;
    
    if (grids.count == 2)
    {
        if ([(NSIndexPath*)[grids objectAtIndex:1] section] == [(NSIndexPath*)[grids objectAtIndex:0] section]+1)  //(m,n) & (m+1,n)
        {
            width = FRAMEMINWIDTH;
            height = FRAMEMINWIDTH*2 + PADDING;
        }
        else  // (m,n) & (m,n+1)
        {
            width = FRAMEMINWIDTH*2 + PADDING;
            height = FRAMEMINWIDTH;
        }
    }
    
    return CGRectMake(x, y, width, height);
}

- (void)layoutWithWeightArray:(NSArray*)array
{
    self.availableGrid = [NSMutableArray array];
    self.resultGridsArray = [NSMutableArray array];
    
    int weight = 0;
    int range = 0;
    
    for (NSDictionary *picture in array)  //typeamount % 7 = 0, means the pictures can form a rectangle
    {
        NSString * type = [picture objectForKey:@"weight"];
        weight += [type intValue];
        range ++;
        
        if (weight % BASICGRIDNUMBER == 0 && (weight!=BASICGRIDNUMBER && range == 1) && weight!=BASICGRIDNUMBER*2) //at least 3 rows but a long picture for a row is fine
        {
            break;
        }
    }
    
    
    for (numberOfRows = 0; numberOfRows< weight/BASICGRIDNUMBER; numberOfRows++) //put the n*7 grids into available array
    {
        for (int j=0; j<7; j++)
        {
            [self.availableGrid addObject:[NSIndexPath indexPathForRow:j inSection:numberOfRows]];
        }
    }

    
    pictures = [NSMutableArray arrayWithArray:[array subarrayWithRange:NSMakeRange(0, range)]];
    
        
    while (pictures.count != 0)
    {
        NSDictionary *picture = [pictures objectAtIndex:0];
        NSString *picweight = [picture objectForKey:@"weight"];
        if ([[self arrayWillFormRect:[picweight intValue]] count]!=0) 
        {
            UIImageView *view = [[UIImageView alloc] initWithFrame:[self frameFromGrids:[self arrayWillFormRect:[picweight intValue]]]];
            [self addSubview:view];
            view.tag = [(NSIndexPath*)[[self arrayWillFormRect:[picweight intValue]]objectAtIndex:0] section]*BASICGRIDNUMBER + [(NSIndexPath*)[[self arrayWillFormRect:[picweight intValue]]objectAtIndex:0] row];
            view.image = [UIImage imageNamed:[picture objectForKey:@"image"]];
            
            if ([picweight intValue] == 1) view.image = [UIImage imageNamed:@"img-1.png"]; //just for test
            
            [self.resultGridsArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:[self arrayWillFormRect:[picweight intValue]],@"grids",picweight,@"weight",[picture objectForKey:@"image"],@"image", nil]];
            
            [self.availableGrid removeObjectsInArray:[self arrayWillFormRect:[picweight intValue]]];
            [pictures removeObject:picture];
        }
        else 
        {
            [self dealWithSpace:picture];
        }
    }

}

- (CGFloat)heightForCell
{
    return FRAMEMINWIDTH * numberOfRows + PADDING * numberOfRows ;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
