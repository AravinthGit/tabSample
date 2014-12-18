//
//  helpContentVC.h
//  tabSample
//
//  Created by Admin on 12/16/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "AppDelegate.h"
@interface helpContentVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgContent;
@property (strong, nonatomic) IBOutlet UITextView *txtContent;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property NSUInteger pageIndex;
@property NSString *text;
@property NSString *imageFile;

@end
