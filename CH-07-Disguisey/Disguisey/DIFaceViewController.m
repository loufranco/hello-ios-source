//
//  DIFirstViewController.m
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "DIFaceViewController.h"
#import "DIDisguiseElement.h"
#import "DIAppDelegate.h"
@implementation DIFaceViewController

@synthesize disguise = _disguise;
@synthesize faceImage = _faceImage;




-(IBAction)pickFace:(id)sender
{
    UIImagePickerController* picker = 
      [[UIImagePickerController alloc] init]; 
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)releasePicker:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(UIImage*)resizedFaceImage: (UIImage*)face
{
    CGFloat vw = self.faceImage.frame.size.width;
    CGFloat vh = self.faceImage.frame.size.height;
    
    CGSize size = CGSizeMake(vw, vh);  
    UIGraphicsBeginImageContext(size);
    
    CGFloat fw = face.size.width, fh = face.size.height;
    CGFloat ratio = vh / fh;   
    CGFloat newW = fw * ratio;
    CGFloat newH = fh * ratio;
    
    [face drawInRect:
       CGRectMake((vw-(newW))/2, 0, newW, newH)];
    
    UIImage *newFace = UIGraphicsGetImageFromCurrentImageContext(); 
    UIGraphicsEndImageContext();
    return newFace;  
}

- (void)imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* face = 
      [info objectForKey:UIImagePickerControllerEditedImage];
    face = [self resizedFaceImage:face];
    self.faceImage.image = face;
    [self releasePicker:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self releasePicker:picker];
}


 	
-(void)faceWasTouched:(CGPoint)point
{
    if ([self.disguise wasElementChosen]) {
        DIDisguiseElement* el = 
        [self.disguise placeChosenElement:point];
        [self drawDisguiseElement:el startingAtPoint:point];
    }
}

-(void)drawDisguiseElement:(DIDisguiseElement*)el 
           startingAtPoint:(CGPoint)p
{
    UIImageView* imageView = 
        [[UIImageView alloc] initWithImage:el.image];
    
    [self.faceImage addSubview:imageView];
    imageView.bounds = CGRectMake(0,0,
            el.image.size.width, el.image.size.height);
    imageView.center = el.point;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.faceImage.faceViewController = self; 
    DIAppDelegate* app = (DIAppDelegate*)
        [[UIApplication sharedApplication] delegate];
    self.disguise = app.disguise;    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
