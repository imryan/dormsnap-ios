//
//  DSExploreViewController.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/17/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSConstants.h"
#import "DSTabBarItem.h"

#import "DSExploreViewController.h"

@interface DSExploreViewController ()

@end

@implementation DSExploreViewController

#pragma mark - View

- (void)viewWillAppear:(BOOL)animated {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DSTabBarItem *feedItem = [[DSTabBarItem alloc] initWithImage:[DSConstants tabBarExploreImage] index:2];
        [[self navigationController] setTabBarItem:feedItem];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
