//
//  UIColor+Extend.h
//  XFTools
//
//  Created by 谢帆 on 16/12/1.
//  Copyright © 2016年 谢帆. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIColorFromHex(HexValue) ([UIColor colorWithHex:HexValue])/**<转换16进制颜色*/

#define UI_ColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a] /**<RGB颜色设置*/

@interface UIColor (Extend)


/*!
 *  @author 谢帆
 *
 *  @brief  16进制获取颜色
 *
 *  @param hex  16进制颜色值
 *
 *  @return 颜色
 *
 *  @since 2.8.0
 */
+ (UIColor *) colorWithHex:(unsigned int)hex;

/*!
 *  @author 谢帆
 *
 *  @brief  16进制获取颜色，并且设置颜色透明度
 *
 *  @param hex   16进制颜色值
 *  @param alpha 颜色透明度
 *
 *  @return 颜色
 *
 *  @since 2.8.0
 */
+ (UIColor *) colorWithHex:(unsigned int)hex
                     alpha:(CGFloat)alpha;

/*!
 *  @author 谢帆
 *
 *  @brief  随机获取颜色
 *
 *  @return 颜色
 *
 *  @since 2.8.0
 */
+ (UIColor *) randomColor;

@end
