//
//  MainViewController.h
//  BackOffice2.0
//
//  Created by Эльвира on 06.05.14.
//  Copyright (c) 2014 soft-artel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundVC.h"
#import "TaskCell.h"
#import "TaskInPauseCell.h"
#import "SwipeView.h"


@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SwipeViewDataSource, SwipeViewDelegate, UIGestureRecognizerDelegate> {
    BackgroundVC* background;
}


@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *bgrImage;
@property (weak, nonatomic) IBOutlet UITableView *tasksTable;

@end
