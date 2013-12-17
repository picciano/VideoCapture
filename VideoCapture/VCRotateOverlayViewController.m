//
//  VCRotateOverlayViewController.m
//  VideoCapture
//
//  Created by Anthony Picciano on 12/16/13.
//  Copyright (c) 2013 Anthony Picciano. All rights reserved.
//

#import "VCRotateOverlayViewController.h"

@interface VCRotateOverlayViewController ()

@end

@implementation VCRotateOverlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)updateOrientation
{
    /*
     UIDeviceOrientationUnknown,
     UIDeviceOrientationPortrait,
     UIDeviceOrientationPortraitUpsideDown,
     UIDeviceOrientationLandscapeLeft,
     UIDeviceOrientationLandscapeRight,
     UIDeviceOrientationFaceUp,
     UIDeviceOrientationFaceDown
     */
    
    switch ([[UIDevice currentDevice] orientation]) {
        case UIDeviceOrientationUnknown:
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationPortraitUpsideDown:
        case UIDeviceOrientationFaceUp:
        case UIDeviceOrientationFaceDown:
            self.view.hidden = NO;
            break;
            
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            self.view.hidden = YES;
            [self.view removeFromSuperview];
            break;
            
        default:
            self.view.hidden = NO;
            break;
    }
    
    [self performSelector:@selector(updateOrientation) withObject:nil afterDelay:0.5f];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self performSelector:@selector(updateOrientation) withObject:nil afterDelay:0.5f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
