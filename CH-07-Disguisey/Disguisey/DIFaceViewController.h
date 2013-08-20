//
//  DIFirstViewController.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <UIKit/UIKit.h>
#import "DIDisguise.h"
#import "DIFaceImageView.h"

 
@interface DIFaceViewController : UIViewController
   <UIImagePickerControllerDelegate, UINavigationControllerDelegate>  


@property(strong, nonatomic) IBOutlet DIFaceImageView* faceImage;
@property(strong, nonatomic) DIDisguise* disguise;


 	
-(void)faceWasTouched:(CGPoint)point;
-(void)drawDisguiseElement:(DIDisguiseElement*)el 
           startingAtPoint:(CGPoint)p;
 	

 	
-(IBAction)pickFace:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker 
    didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:
    (UIImagePickerController *)picker; 	

@end
