//
//  GoodsView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/8/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "GoodsView.h"

@implementation GoodsView

- (id)init
{
    self = [super init];
    if (self) {
        UILabel *imageView = [[UILabel alloc]init];
        imageView.backgroundColor = [self randomColor];
        imageView.layer.borderColor = [UIColor blackColor].CGColor;
        imageView.layer.borderWidth = 2;
        imageView.layer.cornerRadius = 10;
        imageView.layer.masksToBounds = YES;
        imageView.text = @"Image";
        imageView.textAlignment = NSTextAlignmentCenter;
        [self addSubview:imageView];
        
        int padding = 5;
        
        [imageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.top).offset(padding);
            make.left.equalTo(self.left).offset(padding);
            make.right.equalTo(self.right).offset(-padding);
            make.height.equalTo(self.width).offset(-2*padding);
        }];
        
        UILabel *descriptionLabel = [[UILabel alloc] init];
        descriptionLabel.numberOfLines = 2;
        descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        descriptionLabel.font = [UIFont systemFontOfSize:12];
        descriptionLabel.text = @"Description     Description Description";
        [self addSubview:descriptionLabel];
        [descriptionLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.bottom).offset(padding);
            make.left.equalTo(self.left).offset(padding);
            make.width.equalTo(self.width);
            make.height.equalTo(35);
        }];
        
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.text = @"¥ 9999.99";
        priceLabel.textColor = [UIColor redColor];
        [self addSubview:priceLabel];
        [priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(descriptionLabel.bottom);
            make.left.equalTo(self.left).offset(padding);
            make.width.equalTo(self.width);
            make.bottom.equalTo(self.bottom);
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
