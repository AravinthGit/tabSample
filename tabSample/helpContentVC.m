//
//  helpContentVC.m
//  tabSample
//
//  Created by Admin on 12/16/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "helpContentVC.h"
#import "ViewController.h"

@interface helpContentVC ()

@end

@implementation helpContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
     _imgContent.image=[UIImage imageNamed:_imageFile];
    UIBezierPath *exclusivePath=[UIBezierPath bezierPathWithRect:CGRectMake(_imgContent.frame.origin.x,_imgContent.frame.origin.y, _imgContent.frame.size.width, _imgContent.frame.size.height)];
    _txtContent.textContainer.exclusionPaths=@[exclusivePath];
   
    //_txtContent.text=_text;
    
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


@end
