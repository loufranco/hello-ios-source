//
//  HWViewController.m
//  Hello
//
//  Created by Louis Franco and Eitan Mendelowitz.
//
//

#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sayHello:(id)sender {
    self.userNameLabel.text = self.userNameTextField.text;
    self.userNameLabel.hidden = NO;
    self.helloLabel.hidden = NO;
}
@end
