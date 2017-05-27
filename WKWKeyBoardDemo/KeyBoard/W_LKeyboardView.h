//
//  W_LKeyboardView.h
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import <UIKit/UIKit.h>
@class W_LKeyboardView;
@protocol W_LKeyBoardViewDelegate <NSObject>

@optional

- (void)keyboard:(W_LKeyboardView *)keyboard didClickTextButton:(UIButton *)textBtn string:(NSMutableString *)string;


- (void)changeKeyboardType;

- (void)confirmDelegateAction;

- (void)ScrollShow:(W_LKeyboardView *)keboard testField:(UITextField *)testField;

- (void)ScrollShow:(W_LKeyboardView *)keboard testView:(UITextView *)testView;
@end

@interface W_LKeyboardView : UIView
typedef enum{
    LetterKeyBoardViewType=0,//字母键盘
    NumberKeyBoardViewType//数字键盘
}myKeyboardType;

@property (nonatomic,assign) NSInteger  myBoardType; //操作类型
@property (nonatomic, assign) id<W_LKeyBoardViewDelegate> delegate;
@property (nonatomic, strong) NSMutableString *string;
@property (nonatomic, retain) UIScrollView *searchScroll;
@end
