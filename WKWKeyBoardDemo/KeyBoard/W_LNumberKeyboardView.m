//
//  W_LNumberKeyboardView.m
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import "W_LNumberKeyboardView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@implementation W_LNumberKeyboardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createButton];
    }
    return self;
}

#pragma mark - 创建数字键盘
-(void)createButton
{
    
    NSMutableArray *arrM = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"",@"确定", nil];
    UIImage *image = [UIImage imageNamed:@""];
    UIImage *highImage = [self imageWithColor:[UIColor lightGrayColor]];
    int index = 0;
    double w = (WIDTH-100)/3;
    double h = (216-30)/4;
    for (int k = 0; k <2; k++) {
        NSString *title;
        if (k ==0) {
            title = @"删除";
        }else {
            title = @"确定";
        }
        UIButton *btn =[W_LKeyboardTool setupBasicButtonsWithTitle:title image:image highImage:highImage];
        btn.frame = CGRectMake(5 + 3*(w+5),6 + k*(h*2+12) , w, 2*h+6);
        [self addSubview:btn];
        btn.backgroundColor = [UIColor whiteColor];
        if (k == 0) {
            [btn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }else {
            [btn addTarget:self action:@selector(numBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            
            
            double x = 5 + j*(w+5);
            double y = 6 + i*(h+6);
            
            NSString *title = arrM[index];
            
            UIButton *numBtn = [W_LKeyboardTool setupBasicButtonsWithTitle:title image:image highImage:highImage];
            [numBtn addTarget:self action:@selector(numBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            numBtn.frame = CGRectMake(x, y, w, h);
            numBtn.backgroundColor = [UIColor whiteColor];
            //设置点击时按钮背景图片
            [numBtn setBackgroundImage:[UIImage imageNamed:@"dj"] forState:UIControlStateHighlighted];
            [numBtn setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
            [self addSubview:numBtn];
            index++;
            //没有第12个按钮，直接返回
            if (index == 12) {
                break;
            }
        }
    }
}

//点击数字，隐藏，清空，确定等按钮
- (void)numBtnClick:(UIButton *)numBtn {
    
    if ([self.delegate respondsToSelector:@selector(numberKeyboard:didClickButton:)]) {
        [self.delegate numberKeyboard:self didClickButton:numBtn];
    }
}

//点击删除按钮
- (void)deleteBtnClick:(UIButton *)deleteBtn {
    if ([self.delegate respondsToSelector:@selector(customKeyboardDidClickDeleteButton:)]) {
        [self.delegate customKeyboardDidClickDeleteButton:deleteBtn];
    }
}
//颜色转图片
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
