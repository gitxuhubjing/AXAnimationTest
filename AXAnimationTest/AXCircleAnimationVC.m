//
//  AXCircleAnimationVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/7/30.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "AXCircleAnimationVC.h"

@interface AXCircleAnimationVC ()

@end

@implementation AXCircleAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect boundingRect = CGRectMake(0, 0, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [self.circleIV.layer addAnimation:orbit forKey:@"orbit"];
    
    //这样写
    //CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
