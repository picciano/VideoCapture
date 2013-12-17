//
//  VCViewController.m
//  VideoCapture
//
//  Created by Anthony Picciano on 12/16/13.
//  Copyright (c) 2013 Anthony Picciano. All rights reserved.
//

#import "VCViewController.h"
#import "VCRotateOverlayViewController.h"

@interface VCViewController ()

@end

@implementation VCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)captureVideo:(id)sender
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [picker setMediaTypes:[NSArray arrayWithObject:@"public.movie"]];
    [picker setAllowsEditing:YES];
    [picker setVideoMaximumDuration:30.0f];
    
    VCRotateOverlayViewController *overlay = [[VCRotateOverlayViewController alloc] initWithNibName:nil bundle:nil];
    overlay.view.center = self.view.center;
    [picker setCameraOverlayView:overlay.view];
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)selectVideoFromLibrary:(id)sender
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setMediaTypes:[NSArray arrayWithObject:@"public.movie"]];
    [picker setAllowsEditing:YES];
    [picker setVideoMaximumDuration:30.0f];
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"imagePickerController:didFinishPickingMediaWithInfo:");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel:");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
