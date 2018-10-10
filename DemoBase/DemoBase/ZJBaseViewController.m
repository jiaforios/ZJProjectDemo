//
//  ZJBaseViewController.m
//  CustomNav
//
//  Created by admin on 2018/9/29.
//  Copyright © 2018年 com. All rights reserved.
//

#import "ZJBaseViewController.h"


@interface ZJBaseViewController ()

@end

@implementation ZJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self zj_setDefaultNavigationView];
    self.title = NSStringFromClass([self class]);

}


@end
