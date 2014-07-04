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
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.backgroundColor = [self randomColor];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        UIColor *firstColor, *lastColor;
        
        for (int i=1; i<6; i++) {
            UILabel *label =  [[UILabel alloc] initWithFrame:CGRectMake(i*320, 0, 320, 150)];
            label.backgroundColor = [self randomColor];
            label.text = [NSString stringWithFormat:@"Image %d", i];
            label.textAlignment = NSTextAlignmentCenter;
            [_scrollView addSubview:label];
            if (i==1) {
                firstColor = label.backgroundColor;
            }
            else if (i==5)
            {
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
    NSLog([NSString stringWithFormat:@"%f", _scrollView.contentOffset.x]);
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
