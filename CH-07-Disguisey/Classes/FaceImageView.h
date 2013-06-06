//
//  FaceImageView.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//



#import <UIKit/UIKit.h>
@class FaceViewController;

@interface FaceImageView : UIImageView {
	FaceViewController* faceViewController;
}

@property(assign, nonatomic) FaceViewController* faceViewController;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end


