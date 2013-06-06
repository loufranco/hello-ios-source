//
//  DIDisguise.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "DIDisguiseElement.h"

@interface DIDisguise : NSObject

-(DIDisguiseElement*)placeChosenElement:(CGPoint)point;
-(void)clear;
-(bool)wasElementChosen;
@property(strong, nonatomic) NSMutableArray* elements;
@property(strong, nonatomic) UIImage* lastChosenImage;

@end
