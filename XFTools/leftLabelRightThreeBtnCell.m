//
//  leftLabelRightThreBtnCell.m
//  XFTools
//
//  Created by 谢帆 on 16/12/1.
//  Copyright © 2016年 谢帆. All rights reserved.
//

#import "leftLabelRightThreeBtnCell.h"

@interface leftLabelRightThreeBtnCell ()

@end

@implementation leftLabelRightThreeBtnCell
#pragma mark -
#pragma mark Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addView];
    }
    return self;
}

#pragma mark -
#pragma mark Add View
- (void)addView {
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightThreeBtn];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self updateUIConstraints];
}

#pragma mark -
#pragma mark Masonry
- (void)updateUIConstraints {
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(15);
        make.width.equalTo(@55);
        make.centerY.equalTo(self);
    }];
    
    [_rightThreeBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_leftLabel.mas_right).offset(5);
        make.width.equalTo(@(SCREEN_WIDTH - 70));
        make.height.equalTo(@40);
        make.centerY.equalTo(self);
    }];
}


#pragma mark -
#pragma mark Setter & Getter
- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = Demon_13_Font;
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.text = @"转账类型";
        _leftLabel.backgroundColor = [UIColor clearColor];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}

- (MethodOfTriadsBtn *)rightThreeBtn {
    if (!_rightThreeBtn) {
        _rightThreeBtn = [[MethodOfTriadsBtn alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 70, 40) withBtnNum:3 defaultBtnsImg:nil
                                                    SelectBtnsImg:nil titles:@[@"实时转账",@"普通转账",@"次日到账"]];
    }
    return _rightThreeBtn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
