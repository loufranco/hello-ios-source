//
//  FaceViewController.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "DIFaceViewController.h"
#import "DIFaceImageView.h"

@implementation DIFaceViewController

@synthesize faceImage;
@synthesize disguise;
@synthesize viewToDelete;


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
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)releasePicker:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
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
    UIImage* face = [info objectForKey:UIImagePickerControllerEditedImage];
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


- (IBAction)onMoveDisguiseElement:(UIPanGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateBegan || 
        [recognizer state] == UIGestureRecognizerStateChanged) {
        
        UIImageView* v = (UIImageView*)recognizer.view;
        CGPoint translation = 
            [recognizer translationInView:[v superview]];
        
        DIDisguiseElement *el = 
            [self.disguise getElementAtPoint:v.center 
                                   withImage:v.image];
        [el translateByX:translation.x y:translation.y];
        
        v.center = el.point;
                
        [recognizer setTranslation:CGPointZero 
                                   inView:[v superview]];
    }
    
}


- (IBAction)onPinchDisguiseElement:
    (UIPinchGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateBegan || 
        [recognizer state] == UIGestureRecognizerStateChanged) {
        
        UIImageView* v = (UIImageView*)recognizer.view;
            
        CGFloat scaleDifference = recognizer.scale;
        DIDisguiseElement *el = 
            [self.disguise getElementAtPoint:v.center 
                                   withImage:v.image];
        [el scaleBy:scaleDifference];
        
        v.transform = 
            CGAffineTransformMakeScale(el.scale, el.scale);

        [recognizer setScale:1];
    }    
}


- (void) onDeleteDisguiseElement: (UIMenuController*) sender
{
    UIImageView* v = (UIImageView*)self.viewToDelete;
    if (v != nil) {        
        DIDisguiseElement *el = 
            [self.disguise getElementAtPoint:v.center 
                                   withImage:v.image];
        [self.disguise removeElement:el];
        [v removeFromSuperview];
        self.viewToDelete = nil;
    }
}


-(BOOL) canBecomeFirstResponder
{
    return YES;
}

-(BOOL) canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(onDeleteDisguise:))
        return YES;


    if (action == @selector(onSaveFace:))
        return YES;    
    return [super canPerformAction:action withSender:sender];
}


/*
 
-(BOOL) canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(onDeleteDisguise:))
        return YES;
    return [super canPerformAction:action withSender:sender];
}  
 */




-(void)addMenu:(NSArray*)items toView:(UIView*)view 
    pointingAt:(CGRect)target
{
    [self becomeFirstResponder];
    
    UIMenuController* mc = 
        [UIMenuController sharedMenuController];
    mc.menuItems = items;
    
    [mc setTargetRect: target inView: view];
    if (target.origin.y > view.frame.size.height/2)
        mc.arrowDirection = UIMenuControllerArrowDown;
    else 
        mc.arrowDirection = UIMenuControllerArrowUp;
    
    [mc setMenuVisible: YES animated: YES];   
}

- (IBAction)onHoldDisguiseElement:
    (UILongPressGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateBegan) {
        self.viewToDelete = recognizer.view; 

        UIMenuItem* miDelete = [[UIMenuItem alloc] 
            initWithTitle: @"Delete" 
            action:@selector( onDeleteDisguiseElement: )];

        [self addMenu:[NSArray arrayWithObjects: miDelete, nil] 
               toView:self.viewToDelete.superview 
           pointingAt:self.viewToDelete.frame];
    }    
}


- (IBAction)onHoldFace:(UILongPressGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateBegan) {
        
        UIMenuItem* miSave = 
            [[UIMenuItem alloc] initWithTitle: @"Save" 
              action:@selector( onSaveFace: )];
        
        CGPoint point = 
          [recognizer locationInView:self.view];
        CGRect targetFrame = CGRectMake(point.x, point.y, 0, 0);
        
        [self addMenu:[NSArray arrayWithObjects: miSave, nil] 
               toView:self.view 
           pointingAt:targetFrame];
    }    
}



-(UIImageView*) newDisguise:(UIImage*)image
{
    UIImageView* iv = [[UIImageView alloc] initWithImage:image];
    iv.multipleTouchEnabled = YES;
    iv.userInteractionEnabled = YES;
        
    UIPanGestureRecognizer* move = 
        [[UIPanGestureRecognizer alloc] 
          initWithTarget:self 
          action:@selector(onMoveDisguiseElement:)];
    [iv addGestureRecognizer:move];
    
    UIPinchGestureRecognizer* pinch = 
        [[UIPinchGestureRecognizer alloc] 
          initWithTarget:self 
          action:@selector(onPinchDisguiseElement:)];
    [iv addGestureRecognizer:pinch];
    
    UILongPressGestureRecognizer *hold = 
        [[UILongPressGestureRecognizer alloc] 
          initWithTarget:self 
          action:@selector(onHoldDisguiseElement:)];
    [iv addGestureRecognizer:hold];
    
    return iv;
}


- (void) onSaveFace: (UIMenuController*) sender
{
    UIImage* face = 
        [self.disguise overlayDisguisesOnFace:[faceImage image]];
    
    UIImageWriteToSavedPhotosAlbum(face, nil, nil, nil);
}

/* first version

-(UIImageView*) newDisguise:(UIImage*)image
{
    UIImageView* iv = [[UIImageView alloc] initWithImage:image];
    return iv;
}
*/


-(void)drawDisguiseElement:(DIDisguiseElement*)el 
           startingAtPoint:(CGPoint)p
{
    UIImageView* imageView = 
       [self newDisguise:el.image];

    [faceImage addSubview:imageView];
    
    imageView.bounds = CGRectZero; 
    imageView.center = p;
    
    [UIView animateWithDuration:.25 delay:0 
        options:UIViewAnimationCurveEaseIn animations:^{
        imageView.bounds = CGRectMake(0, 0, 
                                      el.image.size.width, 
                                      el.image.size.height);
    }
    completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.faceImage.faceViewController = self; 

    UIGestureRecognizer *hold = 
        [[UILongPressGestureRecognizer alloc] 
          initWithTarget:self 
          action:@selector(onHoldFace:)];
    
    [self.faceImage addGestureRecognizer:hold];

}



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




@end
