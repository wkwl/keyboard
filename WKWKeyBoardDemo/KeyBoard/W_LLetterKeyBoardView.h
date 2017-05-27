//
//  W_LLetterKeyBoardView.h
//  WKWKeyBoardDemo
//
//  Created by 77 on 2017/4/18.
//  Copyright © 2017年 77. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "W_LKeyboardTool.h"
@interface W_LLetterKeyBoardView : UIView
@property (nonatomic, assign) id<W_LKeyboardDelegate> delegate;
@property (nonatomic, retain) UIScrollView *searchScroll;

@end
