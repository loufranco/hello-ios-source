//
//  DIDisguiseElement.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <Foundation/Foundation.h>



@interface DIDisguiseElement : NSObject 

-(id)initWithImage:(UIImage*)image atPoint:(CGPoint)point; 

@property(strong, nonatomic) UIImage *image; 
@property(nonatomic) CGPoint point;

@end

