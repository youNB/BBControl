//
//  BBButton.h
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBControl.h"

@interface BBButton : UIButton

//创建button
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               title:(NSString *)title
               color:(UIColor *)color
             bgcolor:(UIColor *)bgcolor;

//切圆角
- (void)corner:(CGFloat)corner
         width:(CGFloat)width
         color:(UIColor *)color;

//阴影圆角
- (void)shadow:(CGFloat)corner
         color:(UIColor *)color;

@end

