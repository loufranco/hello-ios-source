//
//  FaceViewController.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIDisguise.h"


@class DIFaceImageView;

@interface DIFaceViewController : 
    UIViewController<UIImagePickerControllerDelegate, 
    UINavigationControllerDelegate> 

{
    DIFaceImageView* faceImage;
    DIDisguise* disguise;
    UIView* viewToDelete;
}

@property(strong, nonatomic) IBOutlet DIFaceImageView* faceImage;
@property(strong, nonatomic) DIDisguise* disguise;
@property(strong, nonatomic) UIView* viewToDelete;

-(void)faceWasTouched:(CGPoint)point;
-(void)drawDisguiseElement:(DIDisguiseElement*)el startingAtPoint:(CGPoint)p;

-(IBAction)pickFace:(id)sender;

- (void)imagePickerController:(UIImagePickerController *)picker 
        didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end
