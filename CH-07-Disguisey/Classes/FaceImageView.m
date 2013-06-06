//
//  FaceImageView.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//



#import "FaceImageView.h"
#import "FaceViewController.h"

@implementation FaceImageView
@synthesize faceViewController;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch *touch = 
        [[allTouches allObjects] objectAtIndex:0];
    CGPoint p = [touch locationInView:self];
    [self.faceViewController faceWasTouched:p];
}

- (void)dealloc {
    self.faceViewController = nil;
    [super dealloc];
}

@end

