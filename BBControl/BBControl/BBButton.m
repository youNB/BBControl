//
//  BBButton.m
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import "BBButton.h"

@implementation BBButton

//创建button
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               title:(NSString *)title
               color:(UIColor *)color
             bgcolor:(UIColor *)bgcolor{
    if([super init]){
        self.backgroundColor = bgcolor;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        switch (type) {
            case BBFontThin:
                self.titleLabel.font = [UIFont italicSystemFontOfSize:factor(font)];
                break;
            case BBFontSystem:
                self.titleLabel.font = [UIFont systemFontOfSize:factor(font)];
                break;
            case BBFontBold:
                self.titleLabel.font = [UIFont boldSystemFontOfSize:factor(font)];
                break;
            default:
                break;
        }
    }
    return self;
}

//切圆角
- (void)corner:(CGFloat)corner
         width:(CGFloat)width
         color:(UIColor *)color{
    self.layer.cornerRadius = corner;
    self.layer.borderWidth  = width;
    self.layer.borderColor  = color.CGColor;
}

//阴影圆角
- (void)shadow:(CGFloat)corner
         color:(UIColor *)color{
    self.layer.cornerRadius  = corner;
    self.layer.shadowColor   = color.CGColor;
    self.layer.shadowOffset  = CGSizeZero;
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowPath    = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                          cornerRadius:corner].CGPath;
}

//重写
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    self.layer.backgroundColor = backgroundColor.CGColor;
}

- (UIColor *)backgroundColor{
    return [UIColor colorWithCGColor:self.layer.backgroundColor];
}

@end
