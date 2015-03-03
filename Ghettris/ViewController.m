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
#import "Block.h"

@interface ViewController () {
    CGPoint blockInitCenter;
    NSInteger blockWidth;
    CGRect blockFrame;
}

@property(nonatomic) Block *block;
@property(nonatomic) UIView *tetriminoView;
@property(nonatomic) NSString *blockType;
@property (weak, nonatomic) IBOutlet UIButton *iButton;
@property (weak, nonatomic) IBOutlet UIButton *jButton;
@property (weak, nonatomic) IBOutlet UIButton *lButton;
@property (weak, nonatomic) IBOutlet UIButton *oButton;
@property (weak, nonatomic) IBOutlet UIButton *sButton;
@property (weak, nonatomic) IBOutlet UIButton *tButton;
@property (weak, nonatomic) IBOutlet UIButton *zButton;

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
    NSLog(@"blockWidth is %ld", (long)blockWidth);
    
    //Create the initial Block frame
    self.blockType=@"L";
    self->blockFrame= CGRectMake(margins, 50, width*4, height*4);
    self.block = [[Block alloc] initWithFrame:self->blockFrame blockType:self.blockType];
   
    [self.block setBackgroundColor:[UIColor clearColor]];

    
    self.tetriminoView = [[UIView alloc] initWithFrame:self.block.frame];
    [self.tetriminoView addSubview:self.block];
    
    [self.view addSubview:self.tetriminoView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapShape:(id)sender
{
    if(sender==self.iButton)
        self.blockType=@"I";
    else if(sender==self.jButton)
       self.blockType=@"J";
    else if(sender==self.lButton)
        self.blockType=@"L";
    else if(sender==self.oButton)
        self.blockType=@"O";
    else if(sender==self.sButton)
        self.blockType=@"S";
    else if(sender==self.tButton)
        self.blockType=@"T";
    else if(sender==self.zButton)
        self.blockType=@"Z";
    
    //There has to be a cleaner way to do this...
    NSLog(@"%@", self.blockType);
    [self.tetriminoView removeFromSuperview];
    self.tetriminoView=nil;
    self.block=nil;
    self.block = [[Block alloc] initWithFrame:self->blockFrame blockType:self.blockType];
    [self.block setBackgroundColor:[UIColor clearColor]];
    self.tetriminoView = [[UIView alloc] initWithFrame:self.block.frame];
    [self.tetriminoView addSubview:self.block];
    [self.view addSubview:self.tetriminoView];
}



@end
