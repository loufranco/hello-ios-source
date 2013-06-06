//
//  HWViewController.h
//  Hello
//
//  Created by Louis Franco on 6/6/13.
//
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UILabel *helloLabel;

@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
- (IBAction)sayHello:(id)sender;
@end
