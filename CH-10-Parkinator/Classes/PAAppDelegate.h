//
//  ParkinatorAppDelegate.h
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import <UIKit/UIKit.h>

@class PAMainViewController;

@interface PAAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    PAMainViewController *mainViewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;


@property (nonatomic, strong) IBOutlet PAMainViewController *mainViewController;

@end

