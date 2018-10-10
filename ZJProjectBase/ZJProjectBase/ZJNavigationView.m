//
//  ZJNavigationView.m
//  CustomNav
//
//  Created by admin on 2018/9/29.
//  Copyright © 2018年 com. All rights reserved.
/*
  将ZJNavigationView 分成left + middle + right
 初始状态均分
 根据三个控件的大小，自动分配，但保证middle 一直居中
 三个控件均支持自定义
 */


#import "ZJNavigationView.h"
#import "KVOController/NSObject+FBKVOController.h"
#import "Masonry/Masonry.h"

#define kBarBackgroundViewEdgeLeft 5
#define kBarBackgroundViewEdgeTop 20
#define kBarHeight 44
#define kBarTitleWidth 150

@interface ZJNavigationView ()

@property(nonatomic, strong) UIView *leftBar;
@property(nonatomic, strong) UIView *middleBar;
@property(nonatomic, strong) UIView *rightBar;


@property(nonatomic, strong) UIView *barBackgroundView;


@end


@implementation ZJNavigationView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setLeftDefaultView];
        [self setMiddleDefaultView];
        [self setRightDefaultView];
        [self masnory];
        
        [self addSubview:self.barBackgroundView];
        
        [self observeBars];

    }
    return self;
}

- (void)masnory{
    
    [self.middleBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.barBackgroundView);
        make.width.mas_equalTo(kBarTitleWidth);
        make.height.mas_equalTo(kBarHeight);
    }];
    
    [self.leftBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.barBackgroundView);
        make.right.equalTo(self.middleBar.mas_left);
        make.height.mas_equalTo(kBarHeight);
        make.centerY.equalTo(self.barBackgroundView);
    }];
    
    [self.rightBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.barBackgroundView);
        make.left.equalTo(self.middleBar.mas_right);
        make.height.mas_equalTo(kBarHeight);
        make.centerY.equalTo(self.barBackgroundView);
        
    }];
}

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController{
    self.viewController = viewController;
    return [self initWithFrame:frame];
    
}


- (void) setLeftDefaultView{
    
    if (self.viewController.navigationController.viewControllers.count == 1) {
         self.leftBar = [UIView new];
    }else{
        BackBarButton *btn = [[BackBarButton alloc] init];
        [btn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
         self.leftBar = btn;
    }
    
    [self.barBackgroundView addSubview:self.leftBar];

}

- (void) setMiddleDefaultView{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.middleBar = titleLabel;
    [self.barBackgroundView addSubview:self.middleBar];
}

- (void) setRightDefaultView{
    
    UIView * right = [[UIView alloc] init];
    right.backgroundColor = self.backgroundColor;
    self.rightBar = right;
    [self.barBackgroundView addSubview:self.rightBar];
}


// 观察控件变化
- (void)observeBars{

}

- (void)setTitle:(NSString *)title{
    // 设置中间控件的 title
    ((UILabel *)self.middleBar).text = title;
}

- (UIView *)barBackgroundView{
    if (_barBackgroundView == nil) {
        _barBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(kBarBackgroundViewEdgeLeft, kBarBackgroundViewEdgeTop, CGRectGetWidth(self.frame)-kBarBackgroundViewEdgeLeft*2, CGRectGetHeight(self.frame)-kBarBackgroundViewEdgeTop)];
        
        _barBackgroundView.backgroundColor = self.backgroundColor;
    }
    return _barBackgroundView;
}

- (void)clickBack{

    [self.viewController.navigationController popViewControllerAnimated:YES];
}

- (void)setCustomLeftBar:(UIView *)left{
    // 移除当前，替换新的
    [self.leftBar removeFromSuperview];
    self.leftBar = left;
    [self.barBackgroundView addSubview:self.leftBar];
}

- (void)setCustomMiddleBar:(UIView *)middle{
    [self.middleBar removeFromSuperview];
    self.middleBar = middle;
    [self.barBackgroundView addSubview:self.middleBar];
}

- (void)setCustomRightBar:(UIView *)right{
    [self.rightBar removeFromSuperview];
    self.rightBar = right;
    [self.barBackgroundView addSubview:self.rightBar];
}

- (void)setCustomLeftBars:(NSArray *)lefts{
    [self.leftBar removeFromSuperview];

    for (UIView *view in lefts) {
        [self.barBackgroundView addSubview:view];
    }
    
}

- (void)setCustomMiddleBars:(NSArray *)middles{
    [self.middleBar removeFromSuperview];
    
    for (UIView *view in middles) {
        [self.barBackgroundView addSubview:view];
    }
}

- (void)setCustomRightBars:(NSArray *)rights{
    [self.rightBar removeFromSuperview];
    
    for (UIView *view in rights) {
        [self.barBackgroundView addSubview:view];
    }
}


@end


@implementation BackBarButton

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path =  CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 15, 11);
    CGPathAddLineToPoint(path, NULL, 5,22);
    CGPathAddLineToPoint(path, NULL, 15, 33);
    [[UIColor lightGrayColor] setStroke];
    
    CGContextSetLineWidth(ctx, 1);
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
}


@end
