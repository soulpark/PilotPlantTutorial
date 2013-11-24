//
//  LSSlideMenuViewController.m
//  SlideMenuTest
//
//  Created by Lingostar on 2013. 11. 23..
//  Copyright (c) 2013년 CodersHigh. All rights reserved.
//

#import "LSSlideMenuViewController.h"
#define TOPVIEWREVEAL 50

@interface LSSlideMenuViewController (){
    BOOL rightBaseSlide;
    BOOL leftBaseSlide;
}


@property (strong, nonatomic) UIViewController *topViewController;
@property (strong, nonatomic) UIViewController *rightBaseViewController;
@property (strong, nonatomic) UIViewController *leftBaseViewController;


@property (nonatomic, weak) IBOutlet UIView *leftMenuContainer;
@property (nonatomic, weak) IBOutlet UIView *rightMenuContainer;
@property (nonatomic, weak) IBOutlet UIView *topViewContainer;

@end

@implementation LSSlideMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    leftBaseSlide = NO;
    rightBaseSlide = NO;
    
    if (self.leftBaseStoryboardName){
        UIStoryboard *leftMenuStoryboard = [UIStoryboard storyboardWithName:self.leftBaseStoryboardName bundle:nil];
        self.leftBaseViewController = [leftMenuStoryboard instantiateInitialViewController];
        [self.leftMenuContainer addSubview:self.leftBaseViewController.view];
    }
    
    if (self.rightBaseStoryboardName){
        UIStoryboard *rightMenuStoryboard = [UIStoryboard storyboardWithName:self.rightBaseStoryboardName bundle:nil];
        self.rightBaseViewController = [rightMenuStoryboard instantiateInitialViewController];
        [self.rightMenuContainer addSubview:self.rightBaseViewController.view];
    }
    
    [self.view bringSubviewToFront:self.topViewContainer];
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.topViewContainer.bounds cornerRadius:0.0f];
    self.topViewContainer.layer.shadowPath = shadowPath.CGPath;
    self.topViewContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    self.topViewContainer.layer.shadowRadius = 10.0f;
    self.topViewContainer.layer.shadowOpacity = 0.75f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)toggleLeftMenu:(id)sender
{
    leftBaseSlide = !leftBaseSlide;
    self.leftMenuContainer.hidden = NO;
    
    rightBaseSlide = NO;
    self.rightMenuContainer.hidden = YES;
    
    CGRect topViewFrame = self.view.bounds;
    if (leftBaseSlide){
        self.topViewContainer.clipsToBounds = NO;
        topViewFrame.origin.x = self.view.bounds.size.width - TOPVIEWREVEAL;
    } else {
        topViewFrame.origin.x = 0.0f;
    }
    
    [UIView animateWithDuration:0.5 delay:0.0f options:0 animations:^{
        self.topViewContainer.frame = topViewFrame;
    } completion:^(BOOL finished) {
        if (!leftBaseSlide) self.topViewContainer.clipsToBounds = YES;
    }];
}



- (IBAction)toggleRightMenu:(id)sender
{
    rightBaseSlide = !rightBaseSlide;
    self.rightMenuContainer.hidden = NO;
    
    leftBaseSlide = NO;
    self.leftMenuContainer.hidden = YES;
    
    CGRect topViewFrame = self.view.bounds;
    if (rightBaseSlide){
        self.topViewContainer.clipsToBounds = NO;
        topViewFrame.origin.x = -self.view.bounds.size.width + TOPVIEWREVEAL;
    } else {
        topViewFrame.origin.x = 0.0f;
    }
    
    [UIView animateWithDuration:0.5 delay:0.0f options:0 animations:^{
        self.topViewContainer.frame = topViewFrame;
    } completion:^(BOOL finished) {
        if (!rightBaseSlide) self.topViewContainer.clipsToBounds = YES;
    }];
}

@end
