//
//  AXPulsingHaloVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/8/6.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "AXPulsingHaloVC.h"
#import "PulsingHaloLayer.h"

@interface AXPulsingHaloVC ()
@property (nonatomic, strong) PulsingHaloLayer *halo;
@end

@implementation AXPulsingHaloVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.halo = [PulsingHaloLayer layer];
    self.halo.position = CGPointMake(([UIScreen mainScreen].bounds.size.width)/2, ([UIScreen mainScreen].bounds.size.height)/2);
//    [self.view.layer insertSublayer:self.halo below:self.beaconView.layer];
    [self.view.layer addSublayer:self.halo];
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
