//
//  AXPropertyFunctionTestVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/8/6.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "AXPropertyFunctionTestVC.h"

@interface AXPropertyFunctionTestVC ()
@property (assign, nonatomic) IBOutlet TTCounterLabel *counterLabel;
@end

@implementation AXPropertyFunctionTestVC

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self.counterLabel stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self fillModeTest];
    [self customiseAppearance];
    [self.counterLabel start];

}


- (void)fillModeTest {
    CALayer *colorLayer = [[ CALayer alloc] init];
    colorLayer.position = self.view.center;
    colorLayer.backgroundColor = [UIColor redColor].CGColor;
    colorLayer.bounds = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
    [self.view.layer addSublayer:colorLayer];
    
    CABasicAnimation *boundAn = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundAn.fromValue = [NSValue valueWithCGRect:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    boundAn.toValue = [NSValue valueWithCGRect:CGRectMake(0.0f, 0.0f, 300.0f, 300.0f)];
    boundAn.beginTime = 2.0f;
    boundAn.duration = 5.0f;
    boundAn.fillMode = kCAFillModeRemoved;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObject:boundAn];
    group.duration = 10.0f;
    
    [colorLayer addAnimation:group forKey:nil];
}


#pragma mark -- 
#pragma mark TTCounterLabel Method

- (void)customiseAppearance {
    [self.counterLabel setBoldFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:35]];
    [self.counterLabel setRegularFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35]];
    
    // The font property of the label is used as the font for H,M,S and MS
    [self.counterLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:25]];
    
    // Default label properties
    self.counterLabel.textColor = [UIColor darkGrayColor];
    
    // After making any changes we need to call update appearance
    [self.counterLabel updateApperance];
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
