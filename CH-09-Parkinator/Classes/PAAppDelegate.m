//
//  ParkinatorAppDelegate.m
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import "PAAppDelegate.h"

#import "PAMainViewController.h"

@implementation PAAppDelegate


@synthesize window;

@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    // Add the main view controller's view to the window and display.
    [window addSubview:mainViewController.view];
    [window makeKeyAndVisible];
    self.window.rootViewController = self.mainViewController;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}


@end

