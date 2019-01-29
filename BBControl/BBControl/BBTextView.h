//
//  BBTextView.h
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBControl.h"

@interface BBTextView : UITextView<UITextViewDelegate>
@property(nonatomic, assign) BBForbid forbid;
@property(nonatomic, strong) BOOL (^editEnd)(void);
@property(nonatomic, strong) void (^editBegin)(void);
@property(nonatomic, strong) void (^editChange)(void);

//创建textView
- (instancetype)font:(CGFloat)font
                type:(BBFont)type
               place:(NSString *)place
                text:(NSString *)text;

//切圆角
- (void)corner:(CGFloat)corner
         width:(CGFloat)width
         color:(UIColor *)color;

//阴影圆角
- (void)shadow:(CGFloat)corner
         color:(UIColor *)color;

@end

