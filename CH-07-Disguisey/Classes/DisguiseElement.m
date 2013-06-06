//
//  DisguiseElement.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "DisguiseElement.h"



@implementation DisguiseElement

@synthesize image;
@synthesize point;

-(id)initWithImage:(UIImage*)img atPoint:(CGPoint)pt 
{
	if (self = [super init]) {
		self.image = img; 
		self.point = pt;
	}
	return self;
}

-(void) dealloc
{
	self.image = nil;
	[super dealloc];
}

@end


