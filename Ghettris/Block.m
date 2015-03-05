//
//  Block.m
//  Ghettris
//
//  Created by Justin Guarino on 3/2/15.
//  Copyright (c) 2015 JustinGuarino. All rights reserved.
//

#import "Block.h"

@interface Block()

@property(nonatomic) NSString *blockType;

@end

@implementation Block

//Overrides initWithFrame to take a blocktype as well
//This is needed for drawRect
-(id)initWithFrame:(CGRect)frame blockType:(NSString*)block
{
    
    if([block isEqualToString:@"I"]){
        self.blockType=@"I";
    }
    else if([block isEqualToString:@"J"]){
        self.blockType=@"J";
    }
    else if([block isEqualToString:@"L"]){
        self.blockType=@"L";
    }
    else if([block isEqualToString:@"O"]){
        self.blockType=@"O";
    }
    else if([block isEqualToString:@"S"]){
        self.blockType=@"S";
    }
    else if([block isEqualToString:@"T"]){
        self.blockType=@"T";
    }
    else if([block isEqualToString:@"Z"]){
        self.blockType=@"Z";
    }
    else{
        self.blockType=nil;
    }
    
    self = [super initWithFrame:frame];
    
    return self;
}

-(void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGSize size = CGSizeMake(rect.size.width/4, rect.size.height/4);
    CGPoint origin=rect.origin;
    
    //Each one of these uses the code to draw a single block four times
    //with positions dependant on the type of block to be drawn.
    if([self.blockType isEqual:@"I"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*3);
        [self drawSingleBlock:size :firstBlock :[UIColor cyanColor]];
        CGPoint secondBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :secondBlock :[UIColor cyanColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*3);
        [self drawSingleBlock:size :thirdBlock :[UIColor cyanColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width*3, origin.y+size.height*3);
        [self drawSingleBlock:size :fourthBlock :[UIColor cyanColor]];
        
    }
    else if([self.blockType isEqualToString:@"J"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*2);
        [self drawSingleBlock:size :firstBlock :[UIColor blueColor]];
        CGPoint secondBlock=CGPointMake(origin.x, origin.y+size.height*3);
        [self drawSingleBlock:size :secondBlock :[UIColor blueColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :thirdBlock :[UIColor blueColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*3);
        [self drawSingleBlock:size :fourthBlock :[UIColor blueColor]];
    }
    else if([self.blockType isEqualToString:@"L"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*3);
        [self drawSingleBlock:size :firstBlock :[UIColor orangeColor]];
        CGPoint secondBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :secondBlock :[UIColor orangeColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*3);
        [self drawSingleBlock:size :thirdBlock :[UIColor orangeColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*2);
        [self drawSingleBlock:size :fourthBlock :[UIColor orangeColor]];
        
    }
    else if([self.blockType isEqualToString:@"O"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*2);
        [self drawSingleBlock:size :firstBlock :[UIColor yellowColor]];
        CGPoint secondBlock=CGPointMake(origin.x, origin.y+size.height*3);
        [self drawSingleBlock:size :secondBlock :[UIColor yellowColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width, origin.y+size.height*2);
        [self drawSingleBlock:size :thirdBlock :[UIColor yellowColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :fourthBlock :[UIColor yellowColor]];
    }
    else if([self.blockType isEqualToString:@"S"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*3);
        [self drawSingleBlock:size :firstBlock :[UIColor greenColor]];
        CGPoint secondBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :secondBlock :[UIColor greenColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width, origin.y+size.height*2);
        [self drawSingleBlock:size :thirdBlock :[UIColor greenColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*2);
        [self drawSingleBlock:size :fourthBlock :[UIColor greenColor]];
    }
    else if([self.blockType isEqualToString:@"T"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*3);
        [self drawSingleBlock:size :firstBlock :[UIColor purpleColor]];
        CGPoint secondBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :secondBlock :[UIColor purpleColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width, origin.y+size.height*2);
        [self drawSingleBlock:size :thirdBlock :[UIColor purpleColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*3);
        [self drawSingleBlock:size :fourthBlock :[UIColor purpleColor]];
    }
    else if([self.blockType isEqualToString:@"Z"])
    {
        CGPoint firstBlock=CGPointMake(origin.x, origin.y+size.height*2);
        [self drawSingleBlock:size :firstBlock :[UIColor redColor]];
        CGPoint secondBlock=CGPointMake(origin.x+size.width, origin.y+size.height*2);
        [self drawSingleBlock:size :secondBlock :[UIColor redColor]];
        CGPoint thirdBlock=CGPointMake(origin.x+size.width, origin.y+size.height*3);
        [self drawSingleBlock:size :thirdBlock :[UIColor redColor]];
        CGPoint fourthBlock=CGPointMake(origin.x+size.width*2, origin.y+size.height*3);
        [self drawSingleBlock:size :fourthBlock :[UIColor redColor]];
    }
    else
        NSLog(@"Blocktype not set");
}

//This function was modified to take an origin and size from the above function.
//I also had to modify how each point was assigned, in that I increase the y value rather
//than decrease it as before. This is due to the nature of how I positioned origin of each
//block within the entire frame.
-(void) drawSingleBlock:(CGSize)blockSize :(CGPoint)blockOrigin :(UIColor*)blockColor
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [blockColor setStroke];
    path.lineWidth = 1.0;
    
    NSInteger radius = 5;
    
    CGSize size = blockSize;
    CGPoint origin = blockOrigin;
    
    
    CGPoint topLeft = CGPointMake(origin.x + radius, origin.y);
    
    [path moveToPoint: topLeft];
    
    
    CGPoint topRight = CGPointMake(origin.x + size.width - radius, origin.y);
    CGPoint topRightCenter = CGPointMake( topRight.x, topRight.y + radius);
    [path addLineToPoint: topRight];
    [path addArcWithCenter:topRightCenter radius:radius startAngle: - M_PI / 2.0 endAngle: 0  clockwise:YES];
    
    CGPoint bottomRight = CGPointMake(origin.x + size.width, origin.y + size.height - radius);
    CGPoint bottomRightCenter = bottomRight; bottomRightCenter.x -= radius;
    [path addLineToPoint: bottomRight];
    [path addArcWithCenter:bottomRightCenter radius:radius startAngle: 0 endAngle:M_PI /2.0 clockwise:YES];
    
    CGPoint bottomLeft = CGPointMake(origin.x + radius, origin.y + size.height);
    [path addLineToPoint: bottomLeft];
    CGPoint bottomLeftCenter = bottomLeft; bottomLeftCenter.y -= radius;
    [path addArcWithCenter:bottomLeftCenter radius:radius startAngle: M_PI / 2.0 endAngle: M_PI clockwise:YES];
    [path stroke];
    
    topLeft.x -= radius;
    topLeft.y += radius;
    [path addLineToPoint: topLeft];
    CGPoint topLeftCenter = topLeft; topLeftCenter.x += radius;
    [path addArcWithCenter:topLeftCenter radius:radius startAngle: M_PI endAngle: M_PI + M_PI / 2.0 clockwise:YES];
    
    [blockColor setFill];
    [[UIColor blackColor] setStroke];
    
    [path fill];
    [path stroke];
}

@end