//
//  W_LKeyboardTool.m
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import "W_LKeyboardTool.h"

@implementation W_LKeyboardTool
+ (UIButton *)setupBasicButtonsWithTitle:(NSString *)title image:(UIImage *)image highImage:(UIImage *)highImage {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highImage forState:UIControlStateHighlighted];
    
    return button;
}

@end
