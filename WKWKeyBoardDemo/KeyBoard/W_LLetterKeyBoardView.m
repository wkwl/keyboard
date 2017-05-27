//
//  W_LLetterKeyBoardView.m
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import "W_LLetterKeyBoardView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width


@implementation W_LLetterKeyBoardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLetterKeyBoard];
        
    }
    return self;
}

#pragma mark - 创建字母键盘
-(void)createLetterKeyBoard
{
    UIImage *image = [UIImage imageNamed:@"XXXXX"];
    UIImage *highImage = [self imageWithColor:[UIColor lightGrayColor]];
    NSMutableArray *letterArr = [[NSMutableArray alloc] initWithObjects:@"q",@"w",@"e",@"r",@"t",@"y",@"u",@"i",@"o",@"p",@"a",@"s",@"d",@"f",@"g",@"h",@"j",@"k",@"l",@"隐藏",@"z",@"x",@"c",@"v",@"b",@"n",@"m",@"❌", nil];
    
    
    int index = 0;
    for (int i = 0; i < 4; i++) {
        if (i == 0) {
            for (int j = 0; j < 10; j++){
                double w = (WIDTH-55)/10;
                double h = (180-60)/3;
                double x = 5 + j*(w+5);
                double y = 55 + i*(h+15);
                
                NSString *title = letterArr[index];
                
                UIButton *letBtn = [W_LKeyboardTool setupBasicButtonsWithTitle:title image:image highImage:highImage];
                letBtn.frame = CGRectMake(x, y, w, h);
                letBtn.backgroundColor = [UIColor whiteColor];
                [letBtn addTarget:self action:@selector(charbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
                //                [letBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
                [self addSubview:letBtn];
                letBtn.clipsToBounds = YES;
                letBtn.layer.cornerRadius = 5;
                index++;
            }
        }
        if (i == 1) {
            for (int j = 0; j < 9; j++){
                double w = (WIDTH-55)/10;
                double h = (180-60)/3;
                double x = (5+w)/2 + j*(w+5);
                double y = 55 + i*(h+15);
                NSString *title = letterArr[index];
                
                UIButton *letBtn = [W_LKeyboardTool setupBasicButtonsWithTitle:title image:image highImage:highImage];
                
                letBtn.frame = CGRectMake(x, y, w, h);
                letBtn.backgroundColor = [UIColor whiteColor];
                [letBtn addTarget:self action:@selector(charbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [letBtn setBackgroundImage:[UIImage imageNamed:@"dj"] forState:UIControlStateHighlighted];
                //                [letBtn setImage:[self imageWithColor:[UIColor redColor]] forState:UIControlStateHighlighted];
                [self addSubview:letBtn];
                letBtn.clipsToBounds = YES;
                letBtn.layer.cornerRadius = 5;
                index++;
            }
        }
        if (i == 2) {
            for (int j = 0; j < 9; j++){
                double w = (WIDTH-55)/10;
                double h = (180-60)/3;
                double x = 5 + j*(w+5);
                double y = 55 + i*(h+15);
                NSString *title = letterArr[index];
                
                UIButton *letBtn = [W_LKeyboardTool setupBasicButtonsWithTitle:title image:image highImage:highImage];
                if (j == 0 ) {
                    letBtn.frame = CGRectMake(x, y, w+(w+2)/2, h);
                    letBtn.backgroundColor = [UIColor lightGrayColor];
                    [letBtn addTarget:self action:@selector(charbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
                    [letBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
                }
                else if (j == 8) {
                    [letBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [letBtn setImage:[UIImage imageNamed:@"writing-close"] forState:UIControlStateNormal];
                    [letBtn setTitle:nil forState:UIControlStateNormal];
                    letBtn.frame = CGRectMake(x+(w+2)/2, y, w+(w+2)/2, h);
                    letBtn.backgroundColor = [UIColor lightGrayColor];
                    [letBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                }
                else{
                    letBtn.frame = CGRectMake(x+(w+2)/2, y, w, h);
                    letBtn.backgroundColor = [UIColor whiteColor];
                    [letBtn addTarget:self action:@selector(charbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
                }
                //                [letBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
                [self addSubview:letBtn];
                letBtn.clipsToBounds = YES;
                letBtn.layer.cornerRadius = 5;
                index++;
            }
        }
    }
}

//点击字母，隐藏，清空，确定等按钮
- (void)charbuttonClick:(UIButton *)charButton {
    if ([self.delegate respondsToSelector:@selector(letterKeyboard:didClickButton:)]) {
        [self.delegate letterKeyboard:self didClickButton:charButton];
    }
}

//点击删除按钮
- (void)deleteBtnClick:(UIButton *)deleteBtn {
    if ([self.delegate respondsToSelector:@selector(customKeyboardDidClickDeleteButton:)]) {
        [self.delegate customKeyboardDidClickDeleteButton:deleteBtn];
    }
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect1 = CGRectMake(0.0f, 0.0f,60,60);
    UIGraphicsBeginImageContext(rect1.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect1);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
