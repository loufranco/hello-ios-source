//
//  FaceViewController.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "FaceViewController.h"
#import "FaceImageView.h"

@implementation FaceViewController

@synthesize faceImage;
@synthesize disguise;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		
    }
    return self;
}
*/




-(IBAction)pickFace:(id)sender
{
    UIImagePickerController* picker = 
        [[UIImagePickerController alloc] init]; 
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.view.window addSubview:picker.view];
}

- (void)releasePicker:(UIImagePickerController*)picker
{
    [picker dismissModalViewControllerAnimated:YES];
    [picker.view removeFromSuperview];
    [picker release];
}

-(UIImage*)resizedFaceImage: (UIImage*)face
{
    CGFloat vw = faceImage.frame.size.width;
    CGFloat vh = faceImage.frame.size.height;
    
    CGSize size = CGSizeMake(vw, vh);  
    UIGraphicsBeginImageContext(size);
    
    CGFloat fw = face.size.width;
    CGFloat fh = face.size.height;
    
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
        DisguiseElement* el = 
          [self.disguise placeChosenElement:point];
        [self drawDisguiseElement:el startingAtPoint:point];
    }
}

-(void)drawDisguiseElement:(DisguiseElement*)el 
           startingAtPoint:(CGPoint)p
{
    UIImageView* imageView = 
      [[[UIImageView alloc] initWithImage:el.image] 
         autorelease];

    [faceImage addSubview:imageView];
    imageView.bounds = CGRectMake(0,0,
                                 el.image.size.width, 
                                 el.image.size.height);
    imageView.center = el.point;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.faceImage.faceViewController = self; 
}

 	
/* animations (used in chapter 8)
 
 imageView.frame = CGRectMake(p.x, p.y, 1, 1);
 
 [UIView beginAnimations:@"grow" context:nil];
 [UIView setAnimationDuration:.25];
 [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
 
 
 [UIView commitAnimations];
 
 */



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.faceImage = nil;
	self.disguise = nil;
    [super dealloc];
}


@end
