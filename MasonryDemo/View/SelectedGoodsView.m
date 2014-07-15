//
//  SelectedGoodsView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/4/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "SelectedGoodsView.h"
#import "TopView.h"
#import "GoodsView.h"

@implementation SelectedGoodsView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"飞飞精选";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    [titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left).offset(@(20));
        make.width.equalTo(100);
        make.height.equalTo(20);
    }];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:scrollView];
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.bottom);
        make.left.equalTo(self.left);
        make.width.equalTo(self.width);
        make.bottom.equalTo(self.bottom);
    }];
    
    // We create a dummy contentView that will hold everything (necessary to use scrollRectToVisible later)
    UIView* contentView = [[UIView alloc]init];
    [scrollView addSubview:contentView];
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.height.equalTo(scrollView.height);
    }];
    
    UIView *lastView;;
    
    int n = 7;
    
    for (int i = 0; i < n; i++)
    {
        GoodsView *view = [[GoodsView alloc] init];
        view.backgroundColor = [self randomColor];
        [contentView addSubview:view];
        
        float width = 320.0/3.0;
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentView.top);
            make.left.equalTo(lastView ? lastView.right : contentView.left);
            make.width.equalTo(width);
            make.height.equalTo(contentView.height);
        }];
        lastView = view;
    }
    
    
    for (int i = n; i % 3 != 0; i++)
    {
        NSLog(@"%d",i);
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [self randomColor];
        [contentView addSubview:view];
        
        float width = 320.0/3.0;
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentView.top);
            make.left.equalTo(lastView ? lastView.right : contentView.left);
            make.width.equalTo(width);
            make.height.equalTo(contentView.height);
        }];
        lastView = view;
    }

    // dummy view, which determines the size of the contentView size and therefore the scrollView contentSize
    UIView *sizingView = UIView.new;
    [scrollView addSubview:sizingView];
    [sizingView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lastView.right);
        make.right.equalTo(contentView.right);
    }];
    
    scrollView.pagingEnabled = YES;
    
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
