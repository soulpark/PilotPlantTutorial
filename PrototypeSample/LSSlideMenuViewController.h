//
//  LSSlideMenuViewController.h
//  SlideMenuTest
//
//  Created by Lingostar on 2013. 11. 23..
//  Copyright (c) 2013년 CodersHigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSSlideMenuViewController : UIViewController

@property NSString *leftBaseStoryboardName;
@property NSString *rightBaseStoryboardName;



- (IBAction)toggleLeftMenu:(id)sender;
- (IBAction)toggleRightMenu:(id)sender;

@end
