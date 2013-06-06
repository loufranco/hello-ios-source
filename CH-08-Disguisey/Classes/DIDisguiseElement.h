//
//  DisguiseElement.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIDisguiseElement : NSObject

-(id)initWithImage:(UIImage*)image atPoint:(CGPoint)point;


@property(strong, nonatomic) UIImage *image;
@property(nonatomic) CGPoint point;
@property(nonatomic) CGFloat scale;

-(void)translateByX:(CGFloat)x y:(CGFloat)y;
-(void)scaleBy:(CGFloat)scaleDifference;

-(UIImage*)overlayOnFace:(UIImage *)face;

@end

