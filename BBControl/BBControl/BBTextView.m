//
//  BBTextView.m
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import "BBTextView.h"

@interface BBTextView()
@property(nonatomic, strong) UILabel *place_des;
@property(nonatomic, strong) UITextPosition *position;
@end

@implementation BBTextView

//创建textView
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               place:(NSString *)place
                text:(NSString *)text{
    if([super init]){
        self.place_des = [[UILabel alloc]init];
        self.place_des.text = place;
        self.place_des.textColor = RGB_16(0x7f7f7f, 0.7);
        [self addSubview:self.place_des];
        self.place_des.hidden = text.length;
        
        self.delegate = self;
        self.returnKeyType = UIReturnKeyDone;
        self.position = self.selectedTextRange.start;
        self.text = text;//注意这句话的顺序
        switch (type) {
            case BBFontThin:
                self.font = [UIFont italicSystemFontOfSize:factor(font)];
                self.place_des.font = [UIFont italicSystemFontOfSize:factor(font)];
                break;
            case BBFontSystem:
                self.font = [UIFont systemFontOfSize:factor(font)];
                self.place_des.font = [UIFont systemFontOfSize:factor(font)];
                break;
            case BBFontBold:
                self.font = [UIFont boldSystemFontOfSize:factor(font)];
                self.place_des.font = [UIFont boldSystemFontOfSize:factor(font)];
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
    self.clipsToBounds       = NO;
    self.layer.cornerRadius  = corner;
    self.layer.shadowColor   = color.CGColor;
    self.layer.shadowOffset  = CGSizeZero;
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowPath    = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                          cornerRadius:corner].CGPath;
}

//delegate
- (void)textViewDidChange:(UITextView *)textView{
    self.place_des.hidden = textView.text.length;
    !self.editChange ?: self.editChange();
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    BOOL state = [text isEqualToString:@"\n"];
    if(!state){return YES;}
    if(self.editEnd){return self.editEnd();}
    else{[textView resignFirstResponder]; return YES;}
}

//重写
- (void)setDelegate:(id<UITextViewDelegate>)delegate{
    [super setDelegate: self];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action == @selector(paste:)){return !(self.forbid & BBForbidPaste);}
    if(action == @selector(select:)){return !(self.forbid & BBForbidSelect);}
    if(action == @selector(selectAll:)){return !(self.forbid & BBForbidSelectAll);}
    return [super canPerformAction:action withSender:sender];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect rect = [self caretRectForPosition:self.position];
    rect.origin.x += 3;
    rect.size.width = self.bounds.size.width-2*rect.origin.x;
    self.place_des.frame = rect;
}

@end
