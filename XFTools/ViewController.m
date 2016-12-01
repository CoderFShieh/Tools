//
//  ViewController.m
//  XFTools
//
//  Created by 谢帆 on 16/11/30.
//  Copyright © 2016年 谢帆. All rights reserved.
//

#import "ViewController.h"
#import "leftLabelRightThreeBtnCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MethodOfTriadsBtn *selectView;
@property (nonatomic, strong) UIButton *tempButton;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) leftLabelRightThreeBtnCell *customCell;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
}

- (void)addView {
//    [self.view addSubview:self.selectView];
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.tempButton];
    [self updateUIConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUIConstraints {
    [_tempButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(self.view);
        make.height.and.width.equalTo(@50);
    }];
//
//    [_selectView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.top.equalTo(_tempButton).offset(-50);
//        make.height.equalTo(@20);
//        make.width.equalTo(self.view);
//    }];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark -
#pragma mark Setter & Gettet 
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        
        
    }
    return _mainTableView;
}

- (leftLabelRightThreeBtnCell *)customCell {
    if (!_customCell) {
        _customCell = [[leftLabelRightThreeBtnCell alloc] init];
    }
    return _customCell;
}


- (MethodOfTriadsBtn *)selectView {
    if (!_selectView) {
        _selectView = [[MethodOfTriadsBtn alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width,20) withBtnNum:3 defaultBtnsImg:nil SelectBtnsImg:nil titles:@[@"按钮1",@"按钮2",@"按钮3"]];
    }
    return _selectView;
}

- (UIButton *)tempButton {
    if (!_tempButton) {
        _tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _tempButton.backgroundColor = [UIColor blackColor];
        [_tempButton addTarget:self action:@selector(tempButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tempButton;
}


#pragma mark -
#pragma mark UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.customCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark -
#pragma mark Private Method
- (void)tempButtonClicked {
    NSLog(@"%ld",self.customCell.rightThreeBtn.whichIndex);
}

@end
