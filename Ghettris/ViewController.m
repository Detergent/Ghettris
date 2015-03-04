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
    CGRect blockFrame; //Instance variable used so new tetriminoes can be created after viewDidLoad
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
@property(nonatomic) UISwipeGestureRecognizer *rightSwipe;
@property(nonatomic) UISwipeGestureRecognizer *leftSwipe;
@property(nonatomic) UITapGestureRecognizer *tapGesture;
@property BOOL inMotion;

@end

const NSInteger downAnimationInitDuration = 5.0;
const NSInteger sideAnimationDuration = 1.0;
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
    
    //Create the initial L Block frame
    self.blockType=@"L";
    self->blockFrame= CGRectMake(margins, height, width*4, height*4);
    self.block = [[Block alloc] initWithFrame:self->blockFrame blockType:self.blockType];
    blockInitCenter=self.block.center;
    
    [self.block setBackgroundColor:[UIColor clearColor]];
    
    //Add drawn block to Tetrimino View
    self.tetriminoView = [[UIView alloc] initWithFrame:self.block.frame];
    [self.tetriminoView addSubview:self.block];
    
    [self.view addSubview:self.tetriminoView];
    
    
    //Initialize swipe gestures
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
    [self.rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.rightSwipe];
    
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft:)];
    [self.leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:self.leftSwipe];
    
    //This changes the functionality of the tap in the partial implementation to only drop blocks
    //when the block itself is tapped, rather than anywhere on the screen. This is to keep a block from
    //dropping when a new block is selected.
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:self.tapGesture];
    self.inMotion = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//The current implementation speeds up the speed of the falling drop once the shape is swiped.
-(void) didSwipeLeft: (UISwipeGestureRecognizer *) sender
{
    if (self.inMotion)
        return;
    
    if(self.tetriminoView.center.x>=(margins+2*blockWidth+1)){
        self.inMotion=YES;
        CALayer *layer = self.block.layer;
        CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
        
        layer.speed = 0.0;
        layer.timeOffset = pausedTime;
        CGPoint center = self.tetriminoView.center;
        
        center.x-=blockWidth;
        [UIView animateWithDuration: sideAnimationDuration animations:^{
            self.tetriminoView.center = center;
        } completion:^(BOOL finished) {
            CFTimeInterval pausedTime = [layer timeOffset];
            layer.speed = 1.0;
            layer.timeOffset = 0.0;
            layer.beginTime = 0.0;
            CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
            layer.beginTime = timeSincePause;
            self.inMotion=NO;
        }];
    }
}

//The current implementation speeds up the speed of the falling drop once the shape is swiped.
-(void) didSwipeRight: (UISwipeGestureRecognizer *) sender
{
    if (self.inMotion)
        return;
    
    NSInteger bound;
    if([self.blockType isEqual:@"I"])
        bound=margins+7*blockWidth+1;
    else if([self.blockType isEqual:@"O"])
        bound=margins+9*blockWidth+1;
    else
        bound=margins+8*blockWidth+1;
    
    if(self.tetriminoView.center.x<=bound){
        self.inMotion = YES;
        CALayer *layer = self.block.layer;
        CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
        
        layer.speed = 0.0;
        layer.timeOffset = pausedTime;
        CGPoint center = self.tetriminoView.center;
        
        center.x+=blockWidth;
        [UIView animateWithDuration: sideAnimationDuration animations:^{
            self.tetriminoView.center = center;
        } completion:^(BOOL finished) {
            CFTimeInterval pausedTime = [layer timeOffset];
            layer.speed = 1.0;
            layer.timeOffset = 0.0;
            layer.beginTime = 0.0;
            CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
            layer.beginTime = timeSincePause;
            self.inMotion=NO;
        }];
    }
    
}


-(void) handleTap: (UITapGestureRecognizer *) sender
{
    if( self.inMotion) {
        return;
    }
    self.block.center=blockInitCenter;
    CGPoint center = self.block.center;
    CGPoint newCenter = CGPointMake(center.x, center.y + 315); //the 315 static value may need to change height*9
    [UIView animateWithDuration: downAnimationInitDuration delay:0.0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.block.center = newCenter;
                     } completion:^(BOOL finished) {
                         NSLog(@"Animation complete with status: %@", @(finished));
                         [self.view removeGestureRecognizer:self.rightSwipe];
                         [self.view removeGestureRecognizer:self.tapGesture];
                         [self.view removeGestureRecognizer:self.leftSwipe];
                     }];
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
    //These were needed onces I implemented drop animations
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    [self.view addGestureRecognizer:self.tapGesture];
}



@end
