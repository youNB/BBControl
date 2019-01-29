//
//  BBLabel.m
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import "BBLabel.h"

@implementation BBLabel

//创建label
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               color:(UIColor *)color
                text:(NSString *)text{
    if([super init]){
        self.text      = text;
        self.textColor = color ? color : UIColor.blackColor;
        switch (type) {
            case BBFontThin:
                self.font = [UIFont italicSystemFontOfSize:factor(font)];
                break;
            case BBFontSystem:
                self.font = [UIFont systemFontOfSize:factor(font)];
                break;
            case BBFontBold:
                self.font = [UIFont boldSystemFontOfSize:factor(font)];
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
    self.layer.borderColor  = color.CGColor;
    self.layer.borderWidth  = width;
}

//适配大小
+ (CGSize)adjust:(CGFloat)font
            type:(BBFont)type
         estSize:(CGSize)estSize
            text:(NSString *)text{
    BBLabel *label = [[BBLabel alloc] font:font
                                      type:type
                                     color:UIColor.whiteColor
                                      text:text];
    label.numberOfLines = 0;
    return [label sizeThatFits:estSize];
}

//重写
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    self.layer.backgroundColor = backgroundColor.CGColor;
}

- (UIColor *)backgroundColor{
    return [UIColor colorWithCGColor:self.layer.backgroundColor];
}

@end
