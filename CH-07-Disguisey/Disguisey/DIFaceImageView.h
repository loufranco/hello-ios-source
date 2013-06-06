//
//  DIFaceImageView.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <UIKit/UIKit.h>
@class DIFaceViewController; 

@interface DIFaceImageView : UIImageView

@property(weak, nonatomic) 
    DIFaceViewController* faceViewController;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
