//
//  MainViewController.m
//  BackOffice2.0
//
//  Created by Эльвира on 06.05.14.
//  Copyright (c) 2014 soft-artel. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadMainView)
                                                 name:@"ReloadMainView"
                                               object:nil];

}

- (void) reloadMainView{
    [self viewDidAppear:YES];
    [self.tasksTable reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    background = [[BackgroundVC alloc] initForView:VC_NAME_MAIN_ON];
    [self.bgrImage addSubview:background.backGroundImage];
    [self.bgrImage sendSubviewToBack:background.backGroundImage];
}


- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@",[NSString stringWithFormat:@"view %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"ViewNumber"]]);
    self.label.text = [NSString stringWithFormat:@"view %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"ViewNumber"]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    cell.swipeView.dataSource = self;
    cell.swipeView.delegate = self;
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;


}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //return the total number of items in the carousel
    return 10;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    NSIndexPath* ip = [NSIndexPath indexPathForRow:0 inSection:0];
    TaskCell* curCell = (TaskCell*)[self.tasksTable cellForRowAtIndexPath:ip];

    //create new view if no view is available for recycling
    if (view == nil)
    {
//        currentCell.taskNumber.text = [NSString stringWithFormat:@"%ld", (long)index];
        
        view = [[UIView alloc] initWithFrame:curCell.bounds];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:20];
        label.tag = 1;
        [view addSubview:label];
    
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    view.backgroundColor = [UIColor clearColor];
    
    
    NSIndexPath* ip0 = [NSIndexPath indexPathForRow:0 inSection:0];
    TaskCell* curCell0 = (TaskCell*)[self.tasksTable cellForRowAtIndexPath:ip0];
    NSIndexPath* ip1 = [NSIndexPath indexPathForRow:1 inSection:0];
    TaskCell* curCell1 = (TaskCell*)[self.tasksTable cellForRowAtIndexPath:ip1];
    NSIndexPath* ip2 = [NSIndexPath indexPathForRow:2 inSection:0];
    TaskCell* curCell2 = (TaskCell*)[self.tasksTable cellForRowAtIndexPath:ip2];
    
    if ([swipeView isEqual:curCell0.swipeView]) {
        label.text = @"Task00";
    } else if ([swipeView isEqual:curCell1.swipeView] ) {
        label.text = @"Task01";
    } else {
        label.text = @"Task02";
    }
    
    return view;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return CGSizeMake(self.tasksTable.bounds.size.width - 20, 100);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
