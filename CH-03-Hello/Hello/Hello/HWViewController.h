//
//  HWViewController.h
//  Hello
//
//  Created by Louis Franco and Eitan Mendelowitz.
//
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UILabel *helloLabel;

@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
- (IBAction)sayHello:(id)sender;
@end
