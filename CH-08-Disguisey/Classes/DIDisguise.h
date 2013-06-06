//
//  Disguise.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "DIDisguiseElement.h"

@interface DIDisguise : NSObject {
    NSMutableArray* elements;
    UIImage* lastChosenImage;
}

-(void)clear;
-(bool)wasElementChosen;
-(DIDisguiseElement*)placeChosenElement:(CGPoint)point;

-(void)removeElement:(DIDisguiseElement*)el;
-(DIDisguiseElement*)getElementAtPoint:(CGPoint)pt withImage:(UIImage*)image;

-(UIImage*) overlayDisguisesOnFace:(UIImage *)face;



@property(strong, nonatomic) NSMutableArray* elements;
@property(strong, nonatomic) UIImage* lastChosenImage;

@end

