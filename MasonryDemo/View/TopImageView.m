//
//  TopImageView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/4/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "TopImageView.h"

@implementation TopImageView

//- (id)init {
//    self = [super init];
//    if (!self) return nil;
//    
//    _scrollView = [[UIScrollView alloc]init];
//    _scrollView.backgroundColor = [UIColor grayColor];
//    _scrollView.delegate = self;
//    [self addSubview:_scrollView];
//    [_scrollView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
//    
//    // We create a dummy contentView that will hold everything (necessary to use scrollRectToVisible later)
//    UIView* contentView = [[UIView alloc]init];
//    [_scrollView addSubview:contentView];
//    [contentView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(_scrollView);
//        make.height.equalTo(_scrollView.height);
//    }];
//    
//    
//    UIColor *firstColor, *lastColor;
//    
//    UILabel *label0 =  [[UILabel alloc] init];
//    label0.text = [NSString stringWithFormat:@"Image %d", 5];
//    label0.textAlignment = NSTextAlignmentCenter;
//    [contentView addSubview:label0];
//    [label0 makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(contentView.top);
//        make.left.equalTo(contentView.left);
//        make.width.equalTo(@(320));
//        make.height.equalTo(@(150));
//    }];
//    
//    UIView *lastView = label0;
//    
//    for (int i=1; i<6; i++)
//    {
//        UILabel *label =  [[UILabel alloc] init];
//        label.backgroundColor = [self randomColor];
//        label.text = [NSString stringWithFormat:@"Image %d", i];
//        label.textAlignment = NSTextAlignmentCenter;
//        [contentView addSubview:label];
//        [label makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(contentView.top);
//            make.left.equalTo(lastView.right);
//            make.width.equalTo(@(320));
//            make.height.equalTo(@(150));
//        }];
//        
//        lastView = label;
//        
//        if (i==1) {
//            firstColor = label.backgroundColor;
//        }else if (i==5){
//            lastColor = label.backgroundColor;
//        }
//    }
//    
//    
//    label0.backgroundColor = lastColor;
//
//    UILabel *label6 =  [[UILabel alloc] init];
//    label6.backgroundColor = firstColor;
//    label6.text = [NSString stringWithFormat:@"Image %d", 1];
//    label6.textAlignment = NSTextAlignmentCenter;
//    [contentView addSubview:label6];
//    [label6 makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(contentView.top);
//        make.left.equalTo(lastView.left);
//        make.width.equalTo(@(320));
//        make.height.equalTo(@(150));
//    }];
//    
//    
//    // dummy view, which determines the size of the contentView size and therefore the scrollView contentSize
//    UIView *sizingView = [[UIView alloc] init];
//    [_scrollView addSubview:sizingView];
//    [sizingView makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(lastView.right);
//        make.right.equalTo(contentView.right);
//    }];
//    
//    _scrollView.pagingEnabled = YES;
//    [_scrollView setShowsHorizontalScrollIndicator:NO];
//    [_scrollView setContentOffset:CGPointMake(320, 0)];
//    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(160, 140, 0, 0)];
//    _pageControl.numberOfPages = 5;
//    _pageControl.currentPage = 0;
//    [self addSubview:_pageControl];
//    
//    return self;
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.backgroundColor = [self randomColor];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        UIColor *firstColor, *lastColor;
        
        for (int i=1; i<6; i++)
        {
            UILabel *label =  [[UILabel alloc] initWithFrame:CGRectMake(i*320, 0, 320, 150)];
            label.backgroundColor = [self randomColor];
            label.text = [NSString stringWithFormat:@"Image %d", i];
            label.textAlignment = NSTextAlignmentCenter;
            [_scrollView addSubview:label];
            if (i==1) {
                firstColor = label.backgroundColor;
            }else if (i==5){
                lastColor = label.backgroundColor;
            }
        }
        UILabel *label0 =  [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        label0.backgroundColor = lastColor;
        label0.text = [NSString stringWithFormat:@"Image %d", 5];
        label0.textAlignment = NSTextAlignmentCenter;
        [_scrollView addSubview:label0];
        
        UILabel *label =  [[UILabel alloc] initWithFrame:CGRectMake(320*6, 0, 320, 150)];
        label.backgroundColor = firstColor;
        label.text = [NSString stringWithFormat:@"Image %d", 1];
        label.textAlignment = NSTextAlignmentCenter;
        [_scrollView addSubview:label];
        
        [_scrollView setContentSize:CGSizeMake(7*self.frame.size.width, self.frame.size.height)];
        _scrollView.pagingEnabled = YES;
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setContentOffset:CGPointMake(320, 0)];
    
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(160, 140, 0, 0)];
        _pageControl.numberOfPages = 5;
        _pageControl.currentPage = 0;
        [self addSubview:_pageControl];
        
    
    }
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = _scrollView.frame.size.width;
    NSInteger currentPage = ((_scrollView.contentOffset.x - width / 2) / width);
    [_pageControl setCurrentPage:currentPage];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x<320) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width*5, 0) animated:NO];
    }
    else if (scrollView.contentOffset.x > 320*5)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0) animated:NO];
    }
}
@end
