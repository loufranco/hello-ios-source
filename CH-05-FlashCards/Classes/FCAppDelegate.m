//
//  FlashCardsAppDelegate.m
//  FlashCards
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. See repository license.
//

#import "FCAppDelegate.h"
#import "FCViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FCAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    self.window.rootViewController = self.viewController;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)setupButtonAsImage:(UIButton*) btn 
					 image:(NSString*) image 
				  forState:(UIControlState) state
				   leftCap:(NSInteger) leftCap
					topCap:(NSInteger) topCap
{
    UIImage* originalImage = [UIImage imageNamed:image];	
    UIImage* stretchImage = [originalImage                  
            stretchableImageWithLeftCapWidth:leftCap
                                topCapHeight:topCap];
	
    [btn setBackgroundImage:stretchImage forState:state]; 
	
    [btn setTitleColor:[UIColor whiteColor] forState:state]; 
}

- (void)setupButtonAsImage:(UIButton*) btn 
			   normalImage:(NSString*) normalImage 
			 selectedImage:(NSString*) selectedImage
				   leftCap:(NSInteger) leftCap
					topCap:(NSInteger) topCap
{
    [self setupButtonAsImage:btn image:normalImage 
        forState:UIControlStateNormal leftCap:leftCap topCap:topCap];
	
    [self setupButtonAsImage:btn image:selectedImage  
        forState:UIControlStateSelected leftCap:leftCap topCap:topCap];
}



-(void) pushView
{	
    CATransition* animation = [CATransition animation];
    [animation setDelegate:self];
    
    [animation setType:kCATransitionPush];  
    [animation setSubtype:kCATransitionFromRight];	
    
    [animation setDuration: 0.5]; 
    
    [animation setTimingFunction:  
     [CAMediaTimingFunction 
      functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];

    [[self.window layer] addAnimation:animation forKey:@"push"];	
}



-(void) flipView
{
   [UIView beginAnimations:@"flip" context:nil];
   [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft
            forView:self.window cache:YES];

   [UIView setAnimationDuration: 0.5];
   [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
   [UIView commitAnimations];
}





@end
