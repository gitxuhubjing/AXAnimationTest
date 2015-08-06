//
//  ViewController.m
//  AXAnimationTest
//
//  Created by JingXu on 15/7/30.
//  Copyright (c) 2015年 JingXu. All rights reserved.
//

#import "ViewController.h"
#import "AXPropertyFunctionTestVC.h"

#define keyItemName @"itemName"
#define keysegueName @"segueName"

@interface ViewController ()

@property(nonatomic, strong)NSArray *dataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceArray = @[@{keyItemName : @"属性效果测试",keysegueName :@"PropertyFunctionTest"},
                             @{keyItemName : @"圆周运动", keysegueName :@"CircleAnimation"},
                             @{keyItemName : @"抖动", keysegueName :@"ShakeAnimation"},
                             @{keyItemName : @"图片切换效果", keysegueName :@"PicChangeAnimation"},
                             @{keyItemName : @"脉冲", keysegueName :@"PulsingHaloAnimation"},
                             @{keyItemName : @"path菜单效果", keysegueName :@"PathAnimation"}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.dataSourceArray[[indexPath row]][keyItemName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:self.dataSourceArray[[indexPath row]][keysegueName] sender:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
