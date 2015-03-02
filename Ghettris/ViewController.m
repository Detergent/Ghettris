//
//  ViewController.m
//  Ghettris
//
//  Created by Justin Guarino on 3/1/15.
//  Copyright (c) 2015 JustinGuarino. All rights reserved.
//  This implementation is built off of the TetrisBlock
//  ViewController.m provided by Dr. Ali Kooshesh
//

#import "ViewController.h"
#import "IBlock.h"
#import "JBlock.h"
#import "LBlock.h"
#import "OBlock.h"
#import "SBlock.h"
#import "TBlock.h"
#import "ZBlock.h"

@interface ViewController () {
    CGPoint blockInitCenter;
    NSInteger blockWidth;
}

@property(nonatomic) IBlock *iBlock;
@property(nonatomic) JBlock *jBlock;
@property(nonatomic) LBlock *lBlock;
@property(nonatomic) OBlock *oBlock;
@property(nonatomic) SBlock *sBlock;
@property(nonatomic) TBlock *tBlock;
@property(nonatomic) ZBlock *zBlock;
@property(nonatomic) UIView *tetriminoView;

@end
const CGFloat margins = 10.0;
const NSInteger widthOfBoardInBlocks = 10;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Establish size definitions
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    NSInteger gameViewWidth = (appFrame.size.width - 2 * margins);
    blockWidth= gameViewWidth / widthOfBoardInBlocks;
    NSInteger width = blockWidth, height = width;
    
    //Create the initial LBlock frame
    CGRect lFrameBot = CGRectMake(margins, 100, width*3, height);
    CGRect lFrameTop = CGRectMake(margins+100, 50, width, height);
    CGRect lFrame = CGRectUnion(lFrameBot, lFrameTop);
    
    self.lBlock = [[LBlock alloc] initWithFrame:lFrame];
    [self.lBlock setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.lBlock.center;
    
    self.tetriminoView = [[UIView alloc] initWithFrame:self.lBlock.frame];
    [self.tetriminoView addSubview:self.lBlock];
    
    [self.view addSubview:self.tetriminoView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
