//
//  helpVC.m
//  tabSample
//
//  Created by Admin on 12/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "helpVC.h"
#import "ViewController.h"

@interface helpVC ()

@end

@implementation helpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageImages=@[@"img1.png",@"img2.png",@"img3.png"];
    _pageTexts=@[@"page1",@"page2",@"page3"];
    
    self.pageViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    self.pageViewController.dataSource=self;
    self.pageViewController.view.frame=(CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50));
    self.pageViewController.view.backgroundColor=[UIColor grayColor];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewWillAppear:(BOOL)animated
{
    NSString *page=[[NSUserDefaults standardUserDefaults]stringForKey:@"lastpage"];
    NSNumber *number=[NSNumber numberWithLongLong:page.longLongValue];
    NSUInteger  pageNumber=number.unsignedIntegerValue;
 
    helpContentVC *startingViewController=[self viewControllerAtIndex:pageNumber];
    NSArray *viewController=@[startingViewController];
    [self.pageViewController setViewControllers:viewController direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index=((helpContentVC*) viewController).pageIndex;
    if ((index ==0)|| (index==NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
    
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index=((helpContentVC*) viewController).pageIndex;
    if (index==NSNotFound) {
        return nil;
    }
    index++;
    
    if (index==[self.pageTexts count]) {
        return  nil;
    }
    return [self viewControllerAtIndex:index];
}



-(helpContentVC*)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTexts count] ==0)||(index >=[self.pageTexts count])) {
        return nil;
    }
    helpContentVC *hlpConObj=[self.storyboard instantiateViewControllerWithIdentifier:@"helpContentVC"];
    hlpConObj.imageFile=self.pageImages[index];
   // hlpConObj.text=self.pageTexts[index];
    hlpConObj.pageIndex=index;
    
    return hlpConObj;
}
- (IBAction)close:(id)sender {
    NSString *page=[[NSUserDefaults standardUserDefaults]stringForKey:@"lastpage"];
    NSNumber *number=[NSNumber numberWithLongLong:page.longLongValue];
    NSUInteger  pageNumber=number.unsignedIntegerValue+1;

    self.tabBarController.selectedViewController=[self.tabBarController.viewControllers objectAtIndex:pageNumber];
    
}
@end
