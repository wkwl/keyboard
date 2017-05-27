//
//  ViewController.m
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import "ViewController.h"
#import "W_LKeyboardView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITextFieldDelegate,W_LKeyBoardViewDelegate>
{
    UITextField *testField;
    UITextField *testField1;
    NSInteger tag;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self LetterKeyDemo];
    [self numKeyboardDemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma private methods
- (void)LetterKeyDemo {
    UITextField *test1 = [[UITextField alloc] init];
    [self.view addSubview:test1];
    test1.frame = CGRectMake(10, 20, WIDTH-20, 40);
    test1.backgroundColor = [UIColor redColor];
    W_LKeyboardView *keyboard = [[W_LKeyboardView alloc] init];
    keyboard.delegate = self;
    keyboard.myBoardType = 0;
    test1.inputView = keyboard;
    test1.delegate = self;
    testField = test1;
    testField.tag = 100;
    
}

- (void)numKeyboardDemo {
    UITextField *test2 = [[UITextField alloc] init];
    [self.view addSubview:test2];
    test2.frame = CGRectMake(10, 80, WIDTH-20, 40);
    test2.backgroundColor = [UIColor redColor];
    W_LKeyboardView *keyboard = [[W_LKeyboardView alloc] init];
    keyboard.delegate = self;
    keyboard.myBoardType = 1;
    test2.inputView = keyboard;
    testField1 = test2;
    testField1.delegate = self;
    testField1.tag = 200;

}
#pragma mark - keyboard 代理
- (void)keyboard:(W_LKeyboardView *)keyboard didClickTextButton:(UIButton *)textBtn string:(NSMutableString *)string {
    if (tag == 100) {
         testField.text = string;
    }else {
        testField1.text = string;
    }
    
}
//可以将键盘搜索到的内容放倒keyboardView的scrlloView上（可不写 用自己定义的代替）
- (void)ScrollShow:(W_LKeyboardView *)keboard testField:(UITextField *)testField {
    
}
#pragma mark - textField 代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    tag = textField.tag;
    return YES;
}

@end
