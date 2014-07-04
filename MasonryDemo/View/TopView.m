//
//  TopView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/3/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *view1 = [[UILabel alloc]init];
        view1.backgroundColor = UIColor.greenColor;
        view1.layer.borderColor = UIColor.blackColor.CGColor;
        view1.layer.borderWidth = 2;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
