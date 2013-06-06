//
//  Disguise.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//



#import <Foundation/Foundation.h>
#import "DisguiseElement.h"

@interface Disguise : NSObject {
	NSMutableArray* elements;
	UIImage* lastChosenImage;
}

-(void)clear;
-(bool)wasElementChosen;
-(DisguiseElement*)placeChosenElement:(CGPoint)point;
   


-(void)dealloc;

@property(retain, nonatomic) NSMutableArray* elements;
@property(retain, nonatomic) UIImage* lastChosenImage;

@end


