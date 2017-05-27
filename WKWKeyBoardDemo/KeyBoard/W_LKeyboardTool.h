//
//  W_LKeyboardTool.h
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class W_LLetterKeyBoardView,W_LNumberKeyboardView;
@protocol W_LKeyboardDelegate <NSObject>
- (void)numberKeyboard:(W_LNumberKeyboardView *)number didClickButton:(UIButton *)button;
- (void)letterKeyboard:(W_LLetterKeyBoardView *)letter didClickButton:(UIButton *)button;

- (void)customKeyboardDidClickDeleteButton:(UIButton *)deleteBtn;


@end
@interface W_LKeyboardTool : NSObject
#pragma mark - 添加基础按钮
+ (UIButton *)setupBasicButtonsWithTitle:(NSString *)title image:(UIImage *)image highImage:(UIImage *)highImage;


@end
