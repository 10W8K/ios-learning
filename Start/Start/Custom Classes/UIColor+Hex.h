//
//  UIColor+Hex.h
//  Start
//
//  Created by 想当当 on 13-11-5.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

/**
 * 让UIColor支持Hex值
 * http://imchao.net/2012/01/08/using-hex-value-with-uicolor/
 * 在使用Cocoa的地方，有个很奇怪问题。
 * 为什么每次实例化一个UIColor的时候非要分别指定RGBA四个值，而且每个值都需要除以255.0f。
 * 作为前端出生的我太不适应了。公司产品的界面自定义太多了，需要用到特殊颜色的地方也很多。
 * 一个颜色值从Photoshop吸取出来后，需要复制四个值。
 * n个颜色也就需要复制4n次。
 */
#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor*)colorWithHex:(NSInteger)hexValue;

+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue;

+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue;

@end
