//
//  AXPicChangeAnimationVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/7/30.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "AXPicChangeAnimationVC.h"

@interface AXPicChangeAnimationVC ()

@end

@implementation AXPicChangeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.aboveImageView.hidden = YES;
}

-(IBAction)changeButtonClick:(id)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.belowImageView.layer addAnimation:[self configBelowImageViewAnimations] forKey:@"shuffle"];
        [self.aboveImageView.layer addAnimation:[self configAboveImageViewAnimations] forKey:@"aboveshuffle"];
    });
    
    self.belowImageView.layer.zPosition = 1;
}

- (CAAnimationGroup *)configBelowImageViewAnimations {
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @-1;
    zPosition.toValue = @1;
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.14, @0 ];
    rotation.duration = 1.2;
    rotation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(110, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[zPosition,rotation,position];
    group.duration = 1.2;
    group.beginTime = 0;
    
    return group;

}

- (CAAnimationGroup *)configAboveImageViewAnimations {
    
    CAKeyframeAnimation *aboverotation = [CAKeyframeAnimation animation];
    aboverotation.keyPath = @"transform.rotation";
    aboverotation.values = @[ @0, @-0.14, @0 ];
    aboverotation.duration = 1.2;
    aboverotation.timingFunctions = @[
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                      ];
    
    CAKeyframeAnimation *aboveposition = [CAKeyframeAnimation animation];
    aboveposition.keyPath = @"position";
    aboveposition.values = @[
                             [NSValue valueWithCGPoint:CGPointZero],
                             [NSValue valueWithCGPoint:CGPointMake(-110, -20)],
                             [NSValue valueWithCGPoint:CGPointZero]
                             ];
    aboveposition.timingFunctions = @[
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                      ];
    aboveposition.additive = YES;
    aboveposition.duration = 1.2;

    CAAnimationGroup *abovegroup = [[CAAnimationGroup alloc] init];
    abovegroup.animations = @[aboverotation,aboveposition];
    abovegroup.duration = 1.2;
    abovegroup.beginTime = 0;
    return abovegroup;
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
