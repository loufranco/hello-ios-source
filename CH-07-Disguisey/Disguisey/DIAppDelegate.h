//
//  DIAppDelegate.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <UIKit/UIKit.h>
#import "DIDisguise.h"

@interface DIAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) DIDisguise *disguise;
@property (strong, nonatomic) UIWindow *window;
@end
