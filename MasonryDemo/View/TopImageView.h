//
//  TopImageView.h
//  MasonryDemo
//
//  Created by billy.ho on 7/4/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopImageView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end
