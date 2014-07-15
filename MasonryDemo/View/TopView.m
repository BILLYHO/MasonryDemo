//
//  TopView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/3/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        UILabel *view1 = [[UILabel alloc]init];
        view1.backgroundColor = UIColor.greenColor;
        view1.layer.borderColor = UIColor.blackColor.CGColor;
        view1.layer.borderWidth = 2;
        view1.layer.cornerRadius = 10;
        view1.layer.masksToBounds = YES;
        view1.text = @"top view";
        view1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:view1];
        
        
        UIView *superview = self;
        int padding = 10;
        
        
        [view1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.top).offset(padding);
            make.left.equalTo(superview.left).offset(padding);
            make.bottom.equalTo(superview.bottom).offset(-padding);
            make.right.equalTo(superview.right).offset(-padding);
        }];
        
    }
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
