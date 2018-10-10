//
//  ZJBaseViewController+NavigationView.h
//  CustomNav
//
//  Created by admin on 2018/9/29.
//  Copyright © 2018年 com. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NavigationView)

@property(nonatomic, strong) UIView *nagationView;
@property(nonatomic, copy) NSString * vcTitle;

// default
- (void)zj_setDefaultNavigationView;

// custom
- (void)zj_setCustomNavigationView:(nullable UIView *)navigationView;

- (void)zj_setLeftBarView:(nullable UIView *)leftBarView;

- (void)zj_setRightBarView:(nullable UIView *)rightBarView;

// 组
- (void)zj_setLeftBarViews:(nullable NSArray *)leftBarViews;

- (void)zj_setRightBarViews:(nullable NSArray *)rightBarViews;



@end

NS_ASSUME_NONNULL_END
