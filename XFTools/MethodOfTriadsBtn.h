//
//  MethodOfTriadsBtn.h
//  XFTools
//
//  Created by 谢帆 on 16/11/30.
//  Copyright © 2016年 谢帆. All rights reserved.
//  多个选项按钮的View

#import <UIKit/UIKit.h>

@interface MethodOfTriadsBtn : UIView
@property (nonatomic, assign) NSInteger whichIndex; /**<当前被选中的按钮 默认为0*/

- (id)initWithFrame:(CGRect)frame
         withBtnNum:(NSInteger)num /**<按钮的个数*/
   defaultBtnsImg:(NSArray *)imgArray /**<每个按钮默认的图片（不传则用默认图片）*/
    SelectBtnsImg:(NSArray *)selectImgArray   /**<每个按钮被选中的图片（不传则用默认图片）*/
             titles:(NSArray *)titleArray; /**<按钮标题*/

@end
