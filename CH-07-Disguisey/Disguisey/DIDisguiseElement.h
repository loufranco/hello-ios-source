//
//  DIDisguiseElement.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DIDisguiseElement : NSObject 

-(id)initWithImage:(UIImage*)image atPoint:(CGPoint)point; 

@property(strong, nonatomic) UIImage *image; 
@property(nonatomic) CGPoint point;

@end

