//
//  DSCameraViewController.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/17/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSConstants.h"
#import "DSTabBarItem.h"

#import "DSCameraViewController.h"

@interface DSCameraViewController ()

@end

@implementation DSCameraViewController

#pragma mark - View

- (void)viewWillAppear:(BOOL)animated {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DSTabBarItem *feedItem = [[DSTabBarItem alloc] initWithImage:[DSConstants tabBarCameraImage] index:1];
        [[self navigationController] setTabBarItem:feedItem];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
