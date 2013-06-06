//
//  FlashCardsAppDelegate.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCViewController;

@interface FCAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FCViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet FCViewController *viewController;

@end

