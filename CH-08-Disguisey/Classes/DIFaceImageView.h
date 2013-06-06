//
//  FaceImageView.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//



#import <UIKit/UIKit.h>
@class DIFaceViewController;

@interface DIFaceImageView : UIImageView 

@property(weak, nonatomic) DIFaceViewController* faceViewController;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end

