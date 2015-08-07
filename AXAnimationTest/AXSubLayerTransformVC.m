//
//  AXSubLayerTransformVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/8/7.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)
#import "AXSubLayerTransformVC.h"

static CATransform3D CATransform3DMakePerspective(CGFloat z) {
    CATransform3D t = CATransform3DIdentity;
    t.m34 = - 1.0 / z;
    return t;
}


@interface AXSubLayerTransformVC ()
@property (nonatomic, strong) CALayer *rootLayer;
@end

@implementation AXSubLayerTransformVC

+ (NSString *)displayName {
    return @"Sublayer Transforms";
}

- (void)addLayersWithColors:(NSArray *)colors {
    
    for (UIColor *color in colors) {
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = color.CGColor;
        layer.bounds = CGRectMake(0, 0, 200, 200);
        layer.position = CGPointMake(160, 190);
        layer.opacity = 0.80;
        layer.cornerRadius = 10;
        layer.borderColor = [UIColor whiteColor].CGColor;
        layer.borderWidth = 1.0;
        layer.shadowOffset = CGSizeMake(0, 2);
        layer.shadowOpacity = 0.35;
        layer.shadowColor = [UIColor darkGrayColor].CGColor;
        layer.shouldRasterize = YES;
        [self.rootLayer addSublayer:layer];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = [[self class] displayName];
    
    self.rootLayer = [CALayer layer];
    // Apply perspective transform
    self.rootLayer.sublayerTransform = CATransform3DMakePerspective(1000);
    self.rootLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.rootLayer];
    
    NSArray *colors = @[[UIColor colorWithRed:0.263 green:0.769 blue:0.319 alpha:1.000], [UIColor colorWithRed:0.990 green:0.759 blue:0.145 alpha:1.000], [UIColor colorWithRed:0.084 green:0.398 blue:0.979 alpha:1.000]];
    [self addLayersWithColors:colors];
    
    [self performSelector:@selector(rotateLayers) withObject:nil afterDelay:1.0];
}

- (void)rotateLayers {
    
    // Create basic animation to rotate around the Y and Z axes
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(85), 0, 1, 1)];
    transformAnimation.duration = 1.5;
    transformAnimation.autoreverses = YES;
    transformAnimation.repeatCount = HUGE_VALF;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    int tx = 0;
    // Loop through the sublayers and attach the animations
    for (CALayer *layer in [self.rootLayer sublayers]) {
        [layer addAnimation:transformAnimation forKey:nil];
        
        //在X轴方向移动
        CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        translateAnimation.fromValue = [NSValue valueWithCATransform3D:layer.transform];
        translateAnimation.toValue = [NSNumber numberWithFloat:tx];
        translateAnimation.duration = 1.5;
        translateAnimation.autoreverses = YES;
        translateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        translateAnimation.repeatCount = HUGE_VALF;
        [layer addAnimation:translateAnimation forKey:nil];
        tx += 35;
    }
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
