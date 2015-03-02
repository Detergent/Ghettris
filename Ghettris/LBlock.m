//
//  LBlock.m
//  Ghettris
//
//  Created by Justin Guarino on 3/1/15.
//  Copyright (c) 2015 JustinGuarino. All rights reserved.
//

#import "LBlock.h"

@implementation LBlock

-(void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [[UIColor orangeColor] setStroke];
    path.lineWidth = 1.0;
    
    CGSize size = rect.size;
    CGPoint origin = rect.origin;
    
    CGPoint topLeft = CGPointMake(origin.x, origin.y);
    [path moveToPoint:topLeft];
    
    CGPoint innerRight = CGPointMake(origin.x + size.width - (size.width/3), origin.y);
    [path addLineToPoint:innerRight];
    
    CGPoint upperLeft = CGPointMake(origin.x + size.width - (size.width/3), origin.y + (size.height/2));
    [path addLineToPoint:upperLeft];
    
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    
    [path stroke];
    [path fill];
}

@end