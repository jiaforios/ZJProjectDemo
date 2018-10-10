//
//  ZJNavigationView.h
//  CustomNav
//
//  Created by admin on 2018/9/29.
//  Copyright © 2018年 com. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZJNavigationView;

@protocol ZJNavigationViewDelegate <NSObject>
@optional
- (void)backClickinView:(ZJNavigationView *)ZJNavigationView;

@end


@interface BackBarButton : UIButton

@end


@interface ZJNavigationView : UIView

@property(nonatomic, copy) NSString * title;
@property(nonatomic, weak) id<ZJNavigationViewDelegate>  delegate;
@property(nonatomic, weak) UIViewController  *viewController;

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController;

- (void)setCustomLeftBar:(UIView *)left;

- (void)setCustomMiddleBar:(UIView *)middle;

- (void)setCustomRightBar:(UIView *)right;

- (void)setCustomLeftBars:(NSArray *)lefts;

- (void)setCustomMiddleBars:(NSArray *)middles;

- (void)setCustomRightBars:(NSArray *)rights;


@end

NS_ASSUME_NONNULL_END
