//
//  DisguiseyAppDelegate.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. See repository license.
//

#import <UIKit/UIKit.h>


@interface DIAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITabBarController *tabBar; 
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong)  
   IBOutlet UITabBarController *tabBar;

@end

