//
//  AXPicChangeAnimationVC.h
//  AXAnimationTest
//
//  Created by JingXu on 15/7/30.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXPicChangeAnimationVC : UIViewController
@property(nonatomic, assign)IBOutlet UIImageView *aboveImageView;
@property(nonatomic, assign)IBOutlet UIImageView *belowImageView;

-(IBAction)changeButtonClick:(id)sender;
@end
