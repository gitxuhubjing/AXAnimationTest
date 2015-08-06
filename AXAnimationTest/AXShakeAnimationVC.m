//
//  AXShakeAnimationVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/7/30.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "AXShakeAnimationVC.h"

@interface AXShakeAnimationVC ()

@end

@implementation AXShakeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(shake) withObject:nil afterDelay:1];
}

-(void)shake {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [self.shakeIV.layer addAnimation:animation forKey:@"shake"];
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
