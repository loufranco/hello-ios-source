//
//  DisguiseElement.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import "DIDisguiseElement.h"



@implementation DIDisguiseElement

@synthesize image;
@synthesize point;
@synthesize scale;

-(id)initWithImage:(UIImage*)img atPoint:(CGPoint)pt 
{
    if (self = [super init]) {
        self.image = img; 
        self.point = pt;
        self.scale = 1.0;
    }
    return self;
}



-(void)translateByX:(CGFloat)xDiff y:(CGFloat)yDiff
{
    self.point= CGPointMake(self.point.x + xDiff, self.point.y + yDiff);
}


-(void)scaleBy:(CGFloat)scaleDifference
{
    self.scale = self.scale * scaleDifference;
    if (self.scale < .5 || 
        isnan(self.scale) || isinf(self.scale)) {
        self.scale = .5;
    }
    
}


-(UIImage*)overlayOnFace:(UIImage *)face
{    
    UIGraphicsBeginImageContext(CGSizeMake(face.size.width,
                                           face.size.height)); 
    [face drawAtPoint: CGPointMake(0,0)];
    
    CGSize scaledSize = 
        CGSizeMake(self.image.size.width * self.scale, 
                   self.image.size.height * self.scale);
    
    CGPoint topLeftPoint = 
        CGPointMake(self.point.x - scaledSize.width/2, 
                    self.point.y - scaledSize.height/2);
    
    [self.image drawInRect:CGRectMake(topLeftPoint.x, topLeftPoint.y,
            scaledSize.width, scaledSize.height)];
    UIImage *newFace = UIGraphicsGetImageFromCurrentImageContext(); 
    UIGraphicsEndImageContext();
    return newFace; 
}

@end

