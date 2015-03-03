//
//  Block.h
//  Ghettris
//
//  Created by Justin Guarino on 3/2/15.
//  Copyright (c) 2015 JustinGuarino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Block : UIView
-(id)initWithFrame:(CGRect)frame blockType:(NSString*)block;
@end