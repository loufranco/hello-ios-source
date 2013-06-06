//
//  DIDisguiseElement.m
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DIDisguiseElement.h"


@implementation DIDisguiseElement

@synthesize image = _image;
@synthesize point = _point;

-(id)initWithImage:(UIImage*)img atPoint:(CGPoint)pt 
{
	if (self = [super init]) {
		self.image = img; 
		self.point = pt;
	}
	return self;
}
@end

