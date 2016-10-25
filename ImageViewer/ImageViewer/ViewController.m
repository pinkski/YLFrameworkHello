//
//  ViewController.m
//  ImageViewer
//
//  Created by 张晓岚 on 16/10/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "ViewController.h"
#import <RWUIControls/RWUIControls.h>

@interface ViewController ()
@property (nonatomic, strong) RWRibbonView *imageView;
@property (nonatomic, strong) RWKnobControl *rotationKnob;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create UIImageView
    CGRect frame = self.view.bounds;
    frame.size.height *= 2/3.0;
    self.imageView = [[RWRibbonView alloc] initWithFrame:CGRectInset(frame, 0, 20)];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:self.imageView.bounds];
    iv.image = [UIImage imageNamed:@"sampleImage.jpg"];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView addSubview:iv];
    [self.view addSubview:self.imageView];
    
    // Create RWKnobControl
    frame.origin.y += frame.size.height;
    frame.size.height /= 2;
    frame.size.width  = frame.size.height;
    self.rotationKnob = [[RWKnobControl alloc] initWithFrame:CGRectInset(frame, 10, 10)];
    CGPoint center = self.rotationKnob.center;
    center.x = CGRectGetMidX(self.view.bounds);
    self.rotationKnob.center = center;
    [self.view addSubview:self.rotationKnob];
    
    // Set up config on RWKnobControl
    self.rotationKnob.minimumValue = -M_PI_4;
    self.rotationKnob.maximumValue = M_PI_4;
    [self.rotationKnob addTarget:self
                          action:@selector(rotationAngleChanged:)
                forControlEvents:UIControlEventValueChanged];
}

- (void)rotationAngleChanged:(id)sender
{
    self.imageView.transform = CGAffineTransformMakeRotation(self.rotationKnob.value);
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
