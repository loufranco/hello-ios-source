//
//  DIFaceImageView.m
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//


#import "DIFaceImageView.h"
#import "DIFaceViewController.h"

@implementation DIFaceImageView
@synthesize faceViewController = _faceViewController;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch *touch = 
        [[allTouches allObjects] objectAtIndex:0];
    CGPoint p = [touch locationInView:self];
        [self.faceViewController faceWasTouched:p];
}
@end
