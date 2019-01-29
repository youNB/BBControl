//
//  BBControl.h
//  BBControl
//
//  Created by 程肖斌 on 2019/1/29.
//  Copyright © 2019年 ICE. All rights reserved.
//

#ifndef BBControl_h
#define BBControl_h

#define RGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB_16(value, a) [UIColor colorWithRed:(value >> 16)/255.0 green:(value >> 8 & 0xff)/255.0 blue:(value & 0xff)/255.0 alpha:(a)]

static inline CGFloat factor(CGFloat value){
    static dispatch_once_t once_t = 0;
    static CGFloat scale = 0;
    dispatch_once(&once_t, ^{
        scale = [UIScreen mainScreen].bounds.size.width/375;
    });
    return scale * value;
}

typedef NS_ENUM(NSInteger, BBFont) {
    BBFontThin,     //细体
    BBFontSystem,   //默认
    BBFontBold      //粗体
};

typedef NS_OPTIONS(NSInteger, BBForbid) {
    BBForbidSelect    = 1 << 0, //禁止选择
    BBForbidSelectAll = 1 << 1, //禁止全选
    BBForbidPaste     = 1 << 2, //禁止粘贴
    BBForbidAll       = BBForbidPaste | BBForbidSelect | BBForbidSelectAll
};

#endif /* BBControl_h */
