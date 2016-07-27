//
//  AppDelegate.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSConstants.h"
#import "DSTabBarItem.h"

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBarTintColor:[DSConstants defaultGreenColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                                            NSFontAttributeName : [DSConstants navigationBarFont]
                                                          }];
    
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setTintColor:[DSConstants defaultGreenColor]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]]; // Set custom tab bar image
    
    UITabBarController *tabController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabController.tabBar;
    
    for (NSUInteger i = 0; i < tabBar.items.count; i++) {
        UITabBarItem *item = tabBar.items[i];
        
        if (i == 0) {
            [item setImage:[DSConstants tabBarFeedImage]];
            item = [self temporaryTabBarItem:item index:0];
        }
        else if (i == 1) {
            [item setImage:[DSConstants tabBarCameraImage]];
            item = [self temporaryTabBarItem:item index:1];
        }
        else if (i == 2) {
            [item setImage:[DSConstants tabBarExploreImage]];
            item = [self temporaryTabBarItem:item index:2];
        }
    }
    
    return YES;
}

- (UITabBarItem *)temporaryTabBarItem:(UITabBarItem *)item index:(NSUInteger)index {
    UIImage *image = [UIImage new];
    
    switch (index) {
        case 0:
            image = [DSConstants tabBarFeedImage];
            break;
        case 1:
            image = [DSConstants tabBarCameraImage];
            break;
        case 2:
            image = [DSConstants tabBarExploreImage];
            break;
            
    }
    
    item.title = nil;
    item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    return item;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
