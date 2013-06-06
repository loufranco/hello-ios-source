//
//  FlipsideViewController.h
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import <UIKit/UIKit.h>

@class PAFlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:
    (PAFlipsideViewController *)controller;
@end

@interface PAFlipsideViewController : UIViewController
    <UIImagePickerControllerDelegate,  
     UINavigationControllerDelegate> 

@property (nonatomic, weak) 
    id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, strong) 
    IBOutlet UIImageView *carPhoto; 

- (IBAction)done:(id)sender;
- (IBAction)takeCarPhoto:(id)sender; 

@end

