//
//  DisguiseyAppDelegate.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DisguiseyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITabBarController *tabBar; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain)  
   IBOutlet UITabBarController *tabBar;

@end

