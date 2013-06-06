//
//  FlipsideViewController.m
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "PAFlipsideViewController.h"


@implementation PAFlipsideViewController



-(IBAction)takeCarPhoto:(id)sender {
    
    UIImagePickerController* picker =
        [[UIImagePickerController alloc] init]; 
    picker.delegate = self;
    
    if ([UIImagePickerController 
         isSourceTypeAvailable:
            UIImagePickerControllerSourceTypeCamera] ) {
        picker.sourceType =
            UIImagePickerControllerSourceTypeCamera;
    }
    else {
        picker.sourceType = 
            UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:picker animated:YES completion:nil];
}



- (void)releasePicker:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker 
    didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.carPhoto.image = 
        [info objectForKey:UIImagePickerControllerOriginalImage];
    [self releasePicker:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self releasePicker:picker];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];  
}


- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/




@end
