//
//  BBTextField.m
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import "BBTextField.h"

@implementation BBTextField

//创建textField
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               place:(NSString *)place
                text:(NSString *)text{
    if([super init]){
        self.text          = text;
        self.placeholder   = place;
        self.returnKeyType = UIReturnKeyDone;
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
- (void)setPlaceholder:(NSString *)placeholder{
    [super setPlaceholder:placeholder];
    if(@available(iOS 12.0, *)){
        [self setValue:RGB_16(0x7f7f7f, 0.7)
            forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action == @selector(paste:)){return !(self.forbid & BBForbidPaste);}
    if(action == @selector(select:)){return !(self.forbid & BBForbidSelect);}
    if(action == @selector(selectAll:)){return !(self.forbid & BBForbidSelectAll);}
    return [super canPerformAction:action withSender:sender];
}

- (void)deleteBackward{
    [super deleteBackward];
    !self.deleteWords ?: self.deleteWords();
}

@end
