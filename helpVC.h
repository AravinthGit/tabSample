//
//  helpVC.h
//  tabSample
//
//  Created by Admin on 12/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "helpContentVC.h"

@interface helpVC : UIViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong,nonatomic) UIPageViewController *pageViewController;
@property (strong,nonatomic) NSArray *pageTexts;
@property (strong,nonatomic) NSArray *pageImages;
- (IBAction)close:(id)sender;
@property NSUInteger pagenumber;
@end
