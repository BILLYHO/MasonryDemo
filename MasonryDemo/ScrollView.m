//
//  ScrollView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/3/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "ScrollView.h"
#import "TopView.h"
#import "TopImageView.h"
#import "SelectedGoodsView.h"

@interface ScrollView ()
//@property (strong, nonatomic) UIScrollView* scrollView;
@end

@implementation ScrollView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:scrollView];
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    // We create a dummy contentView that will hold everything (necessary to use scrollRectToVisible later)
    UIView* contentView = [[UIView alloc]init];
    [scrollView addSubview:contentView];
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView.width);
    }];
    
    TopImageView *topImageView = [[TopImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    topImageView.backgroundColor = [self randomColor];
    [contentView addSubview:topImageView];
    [topImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.left.equalTo(@0);
        make.width.equalTo(@(320));
        make.height.equalTo(@(150));
    }];
    
    
    SelectedGoodsView *selectedGoodsView = [[SelectedGoodsView alloc] init];
    selectedGoodsView.backgroundColor = [self randomColor];
    [contentView addSubview:selectedGoodsView];
    [selectedGoodsView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageView.bottom);
        make.left.equalTo(@(0));
        make.width.equalTo(@(320));
        make.height.equalTo(@(150));
    }];
    
    UIView *lastView;
    lastView = selectedGoodsView;
    
    // add view here
    
    
    for (int i = 0; i < 5; i++) {
        TopView *view = [[TopView alloc] init];
        view.backgroundColor = [self randomColor];
        [contentView addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView.bottom).offset(10);
            make.left.equalTo(@0);
            make.width.equalTo(@(320));
            make.height.equalTo(@(100));
        }];
        lastView = view;
    }
    
    
    
    // dummy view, which determines the size of the contentView size and therefore the scrollView contentSize
    UIView *sizingView = UIView.new;
    [scrollView addSubview:sizingView];
    [sizingView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lastView.bottom);
        make.bottom.equalTo(contentView.bottom);
    }];
    
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}



@end
