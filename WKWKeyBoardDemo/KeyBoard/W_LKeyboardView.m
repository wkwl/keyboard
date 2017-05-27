//
//  W_LKeyboardView.m
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import "W_LKeyboardView.h"
#import "W_LKeyboardTool.h"
#import "W_LLetterKeyBoardView.h"
#import "W_LNumberKeyboardView.h"

#define Screen_Size [UIScreen mainScreen].bounds.size

@interface W_LKeyboardView ()<W_LKeyboardDelegate>
@property (nonatomic,strong) W_LLetterKeyBoardView *letterKeyboard;
@property (nonatomic, strong) W_LNumberKeyboardView *numberKeyboard;
@end

@implementation W_LKeyboardView

- (W_LNumberKeyboardView *)numberKeyboard {
    if (!_numberKeyboard) {
        _numberKeyboard = [[W_LNumberKeyboardView alloc] initWithFrame:self.bounds];
        _numberKeyboard.delegate = self;
    }
    return _numberKeyboard;
}

- (W_LLetterKeyBoardView *)letterKeyboard {
    if (!_letterKeyboard) {
        _letterKeyboard = [[W_LLetterKeyBoardView alloc] initWithFrame:self.bounds];
        _letterKeyboard.delegate = self;
    }
    return _letterKeyboard;
}
- (void)setMyBoardType:(NSInteger)myBoardType {
    _myBoardType = myBoardType;
    if (self.myBoardType == 0) {
        [self addSubview:self.letterKeyboard];
        _searchScroll = [[UIScrollView alloc] init];
        [self addSubview:_searchScroll];
        _searchScroll.frame = CGRectMake(0, 0, Screen_Size.width,40);
        _searchScroll.backgroundColor = [UIColor lightGrayColor];
        UILabel *line = [[UILabel alloc] init];
        [_searchScroll addSubview:line];
        line.frame = CGRectMake(0, 0,_searchScroll.contentSize.width, 1);
        [line setBackgroundColor:[UIColor lightGrayColor]];
        [line setAlpha:0.3];
        
    }else {
        [self addSubview:self.numberKeyboard];
        
    }
    
}
//创建自定义键盘的View
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0,Screen_Size.height - 216,Screen_Size.width, 216);
        self.string = [NSMutableString string];
        self.backgroundColor = [UIColor grayColor];
        
        
    }
    return self;
}
#pragma mark - 按钮相应事件
//数字键盘按钮响应事件
- (void)numberKeyboard:(W_LNumberKeyboardView *)number didClickButton:(UIButton *)button {
    if ([button.currentTitle isEqualToString:@"清空"]) {
        if (self.string.length > 0) {
            [self.string deleteCharactersInRange:NSMakeRange(0, self.string.length)];
            if ([self.delegate respondsToSelector:@selector(keyboard:didClickTextButton:string:)]) {
                [self.delegate keyboard:self didClickTextButton:button string:self.string];
            }
        }
    }
    else if ([button.currentTitle isEqualToString:@"隐藏"]) {
        [self.nextResponder resignFirstResponder];
    }
    else if ([button.currentTitle isEqualToString:@"确定"]) {
        [self.nextResponder resignFirstResponder];
      
    }
    else {
        [self appendString:button];
    }
}
//字母键盘按钮的响应事件
- (void)letterKeyboard:(W_LLetterKeyBoardView *)letter didClickButton:(UIButton *)button
{
    if ([button.currentTitle isEqualToString:@"清空"]){
        if (self.string.length > 0){
            [self.string deleteCharactersInRange:NSMakeRange(0, self.string.length)];
            if ([self.delegate respondsToSelector:@selector(keyboard:didClickTextButton:string:)]) {
                [self.delegate keyboard:self didClickTextButton:button string:self.string];
            }
        }
    }
    else if ([button.currentTitle isEqualToString:@"隐藏"]){
        [self.nextResponder resignFirstResponder];
    }
    else if ([button.currentTitle isEqualToString:@"确定"]){
        [self.nextResponder resignFirstResponder];
    }
    else{
        [self appendString:button];
    }
}

#pragma mark - 删除方法
- (void)customKeyboardDidClickDeleteButton:(UIButton *)deleteBtn {
    if (self.string.length > 0) {
        [self.string deleteCharactersInRange:NSMakeRange(self.string.length - 1, 1)];
        if ([self.delegate respondsToSelector:@selector(keyboard:didClickTextButton:string:)]) {
            [self.delegate keyboard:self didClickTextButton:deleteBtn string:self.string];
        }
        
    }
}

#pragma mark - 按钮title转换成string
- (void)appendString:(UIButton *)button {
    
    [self.string appendString:button.currentTitle];
    if ([self.delegate respondsToSelector:@selector(keyboard:didClickTextButton:string:)]) {
        [self.delegate keyboard:self didClickTextButton:button string:self.string];
    }
    
}

@end
