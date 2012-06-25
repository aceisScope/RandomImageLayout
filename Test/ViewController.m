//
//  ViewController.m
//  Test
//
//  Created by B.H. Liu on 12-6-11.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//

#import "ViewController.h"
#import "LayoutCell.h"

#define IMAGE (@"image")
#define WEIGHT (@"weight")

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSArray *imageArray;

@end

@implementation ViewController
@synthesize tableView=_tableView;
@synthesize imageArray=_imageArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //make sure in every LayoutCell, image names of every two items are different from each other 
    self.imageArray = [NSArray arrayWithObjects:[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"9",WEIGHT,@"img-9.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img1.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img2.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img3.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img4.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img5.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img6.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img7.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img8.png",IMAGE, nil], [NSDictionary dictionaryWithObjectsAndKeys:@"4",WEIGHT,@"img-4.png",IMAGE, nil],nil],[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img0.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"9",WEIGHT,@"img-9.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img2.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"4",WEIGHT,@"img-4.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img4.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img5.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img6.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img7.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img8.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img9.png",IMAGE, nil],nil] ,[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img0.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"4",WEIGHT,@"img-4.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img2.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img3.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"2",WEIGHT,@"img-2.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img5.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"9",WEIGHT,@"img-9.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"2",WEIGHT,@"img-2-p.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img8.png",IMAGE, nil], [NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img9.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img10.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img11.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"9",WEIGHT,@"img-9-2.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img13.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"4",WEIGHT,@"img-4-2.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img15.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img16.png",IMAGE, nil],[NSDictionary dictionaryWithObjectsAndKeys:@"1",WEIGHT,@"img17.png",IMAGE, nil],nil],nil];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";  
    LayoutCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[LayoutCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell layoutWithWeightArray:[self.imageArray objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LayoutCell *cell = (LayoutCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return [cell heightForCell];
}

@end
