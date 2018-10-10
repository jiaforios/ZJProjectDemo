//
//  ZJUtilities.h
//  ZJProjectBase
//
//  Created by admin on 2018/10/10.
//  Copyright © 2018年 com. All rights reserved.
//

#ifndef ZJUtilities_h
#define ZJUtilities_h


#define kZJScreenWidth [UIScreen mainScreen].bounds.size.width
#define kZJScreenHeight ([UIScreen mainScreen].bounds.size.height - kBarTopHeight)

#define kBarBackgroundViewEdgeLeft 5
#define kBarBackgroundViewEdgeTop (isIphoneXSeries?44:20)
#define kBarHeight 44
#define kBarTitleWidth 150
#define kBarTopHeight (kBarHeight + kBarBackgroundViewEdgeTop)

#define isIphoneXSeries ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom != 0) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})

#endif /* ZJUtilities_h */
