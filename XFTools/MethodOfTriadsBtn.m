//
//  MethodOfTriadsBtn.m
//  XFTools
//
//  Created by 谢帆 on 16/11/30.
//  Copyright © 2016年 谢帆. All rights reserved.
//

#import "MethodOfTriadsBtn.h"

@interface MethodOfTriadsBtn ()

@property (nonatomic, strong) NSArray *defaultImgArray;
@property (nonatomic, strong) NSArray *selectImgArray;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) NSMutableArray *buttonMutiArray;
@property (nonatomic, assign) NSInteger buttonNum;
@property (nonatomic, strong) UIButton *tempButton;

@end


@implementation MethodOfTriadsBtn
- (id)initWithFrame:(CGRect)frame withBtnNum:(NSInteger)num defaultBtnsImg:(NSArray *)imgArray SelectBtnsImg:(NSArray *)selectImgArray titles:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame]) {
        _buttonNum = num;
        _defaultImgArray = imgArray;
        _selectImgArray = selectImgArray;
        _titlesArray = titleArray;
        [self setUp];
    }
    return self;
}


#pragma mark -
#pragma mark Private Method
- (void)setUp {
    [self addView];
}

- (void)addView {
    for (int i = 0; i < _buttonNum; i++) {
        [self addSubview:[self setButtonAttribute:[UIButton buttonWithType:UIButtonTypeCustom] withDefaultImg:_defaultImgArray[i] selectImg:_selectImgArray[i] title:_titlesArray[i] buttonIndex:i]];
    }
    [self updateUIConstraints];
}

- (void)updateUIConstraints {
    for (int i = 0; i < _buttonMutiArray.count; i++) {
        UIButton *nextButton;
        if (i > 0) {
            nextButton = _buttonMutiArray[i - 1];
        }
        [_buttonMutiArray[i] mas_makeConstraints:^(MASConstraintMaker *make) {
            i == 0 ? make.left.equalTo(self).offset(15) : make.left.equalTo(nextButton.mas_right).offset(15);
            make.height.equalTo(self);
            make.width.equalTo(@((self.frame.size.width - 15 * (_buttonMutiArray.count + 1)) / _buttonMutiArray.count));
            make.centerY.equalTo(self);
        }];
    }
}

/**<设置button的属性*/
- (UIButton *)setButtonAttribute:(UIButton *)button withDefaultImg:(NSString *)defaultImg selectImg:(NSString *)selectImg title:(NSString *)title buttonIndex:(NSInteger)index{
    defaultImg = [self defaultImgIsNull:defaultImg];
    selectImg = [self withSelectImgIsNull:selectImg];
    button.tag = 1300 + index;
    [button setBackgroundColor:[UIColor clearColor]];
    [button setImage:[UIImage imageNamed:defaultImg] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImg] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    button.titleLabel.font = Demon_13_Font;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    if (index == 0) {
        button.selected = YES;
        _tempButton = button;
    }
    [self.buttonMutiArray addObject:button];
    return button;  
}

/**<如果没有给图片则使用默认图片*/
- (NSString *)defaultImgIsNull:(NSString *)imgString {
    if (!imgString || [imgString isEqualToString:@""]) {
        imgString = @"default";
    }
    return imgString;
}

- (NSString *)withSelectImgIsNull:(NSString *)selectImg {
    if (!selectImg || [selectImg isEqualToString:@""]) {
        selectImg = @"select";
    }
    return selectImg;
}


#pragma mark -
#pragma mark Event Response
- (void)buttonClicked:(UIButton *)sender {
    _tempButton.selected = NO;
    sender.selected = YES;
    _tempButton = sender;
    self.whichIndex = sender.tag - 1300;
}


#pragma mark -
#pragma mark Setter & Gettr 
- (NSMutableArray *)buttonMutiArray {
    if (!_buttonMutiArray) {
        _buttonMutiArray = [NSMutableArray array];
    }
    return _buttonMutiArray;
}

@end
