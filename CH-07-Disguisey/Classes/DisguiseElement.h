//
//  DisguiseElement.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <Foundation/Foundation.h>



@interface DisguiseElement : NSObject {
	UIImage *image; 
	CGPoint point; 
}

-(id)initWithImage:(UIImage*)image atPoint:(CGPoint)point; 
-(void)dealloc;

@property(retain, nonatomic) UIImage *image; 
@property(nonatomic) CGPoint point;

@end


