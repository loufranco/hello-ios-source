//
//  FaceViewController.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Disguise.h"




@class FaceImageView;


 

@interface FaceViewController : 
    UIViewController<UIImagePickerControllerDelegate, 
    UINavigationControllerDelegate> 
 
{

		
	FaceImageView* faceImage;
 	
    Disguise* disguise;
 
		
}

@property(retain, nonatomic) IBOutlet FaceImageView* faceImage;
@property(retain, nonatomic) Disguise* disguise;


 	

-(void)faceWasTouched:(CGPoint)point;
-(void)drawDisguiseElement:(DisguiseElement*)el 
           startingAtPoint:(CGPoint)p;

 	

 	

-(IBAction)pickFace:(id)sender;

- (void)imagePickerController:(UIImagePickerController *)picker 
        didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:
    (UIImagePickerController *)picker;
 	


@end
