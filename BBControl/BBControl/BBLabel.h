//
//  BBLabel.h
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBControl.h"

@interface BBLabel : UILabel

//创建label
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               color:(UIColor *)color
                text:(NSString *)text;

//切圆角
- (void)corner:(CGFloat)corner
         width:(CGFloat)width
         color:(UIColor *)color;

//阴影圆角
- (void)shadow:(CGFloat)corner
         color:(UIColor *)color;

//适配大小
+ (CGSize)adjust:(CGFloat)font
            type:(BBFont)type
         estSize:(CGSize)estSize
            text:(NSString *)text;

@end

