//
//  FlashCardsAppDelegate.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <CoreData/CoreData.h>


@class FCViewController;

@interface FCAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FCViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet FCViewController *viewController;


@property (nonatomic, strong) NSPersistentStoreCoordinator *dataStore;
@property (nonatomic, strong) NSManagedObjectModel* dataModel;
@property (nonatomic, strong) NSManagedObjectContext* dataContext;


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
-(void) popView;

-(void) flipView;



@end

