//
//  AXRecordCircleVC.m
//  AXAnimationTest
//
//  Created by JingXu on 15/8/10.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "AXRecordCircleVC.h"
#import "RecordingCircleOverlayView.h"

@interface AXRecordCircleVC ()

@end

@implementation AXRecordCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    RecordingCircleOverlayView *recordingCircleOverlayView = [[RecordingCircleOverlayView alloc] initWithFrame:self.view.bounds strokeWidth:7.f insets:UIEdgeInsetsMake(10.f, 0.f, 10.f, 0.f)];
    recordingCircleOverlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    recordingCircleOverlayView.duration = 10.f;
    [self.view addSubview:recordingCircleOverlayView];
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
