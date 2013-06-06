//
//  FlashCardsAppDelegate.h
//  FlashCards
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCViewController;

@interface FCAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FCViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet FCViewController *viewController;



- (void)setupButtonAsImage:(UIButton*) btn 
			   normalImage:(NSString*) normalImage 
			 selectedImage:(NSString*) selectedImage
				   leftCap:(NSInteger) leftCap
					topCap:(NSInteger) topCap;


- (void)setupButtonAsImage:(UIButton*) btn 
					 image:(NSString*) image 
				  forState:(UIControlState) state
				   leftCap:(NSInteger) leftCap
					topCap:(NSInteger) topCap;



-(void) pushView;



-(void) flipView;


@end

