//
//  TopImageView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/4/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "TopImageView.h"

@implementation TopImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
        scrollView.backgroundColor = [self randomColor];
        [self addSubview:scrollView];
        
        
        UIView *lastView;
        
        for (int i=0; i<5; i++) {
            UILabel *label =  [[UILabel alloc] initWithFrame:CGRectMake(i*320, 0, 320, 150)];
            label.backgroundColor = [self randomColor];
            label.text = [NSString stringWithFormat:@"Image %d", i+1];
            [scrollView addSubview:label];
            
//            [label makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(@(0));
//                make.left.equalTo(lastView ? lastView.right : @(0));
//                make.width.equalTo(@(100));
//                make.height.equalTo(@(150));
//            }];
            
            lastView = label;
        }
        
        [scrollView setContentSize:CGSizeMake(5*self.frame.size.width, self.frame.size.height)];
        //scrollView.scrollEnabled = YES;
        scrollView.pagingEnabled = YES;
        //NSLog([NSString stringWithFormat:@"%f, %f", frame.size.width, frame.size.height]);
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
