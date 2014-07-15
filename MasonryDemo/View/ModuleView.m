//
//  ModuleView.m
//  MasonryDemo
//
//  Created by billy.ho on 7/8/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "ModuleView.h"

@implementation ModuleView

- (id)init
{
    self = [super init];
    if (self) {
        int padding = 10;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"Title";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.top).offset(padding);
            make.left.equalTo(self.left);
            make.width.equalTo(self.width);
            make.height.equalTo(20);
        }];
        
        UILabel *image1 = [[UILabel alloc] init];
        image1.backgroundColor = [self randomColor];
        image1.layer.borderColor = [UIColor blackColor].CGColor;
        image1.layer.borderWidth = 2;
        image1.layer.cornerRadius = 10;
        image1.layer.masksToBounds = YES;
        image1.text = @"Image 1";
        image1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:image1];
        
        UILabel *image2 = [[UILabel alloc] init];
        image2.backgroundColor = [self randomColor];
        image2.layer.borderColor = [UIColor blackColor].CGColor;
        image2.layer.borderWidth = 2;
        image2.layer.cornerRadius = 10;
        image2.layer.masksToBounds = YES;
        image2.text = @"Image 2";
        image2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:image2];
        
        UILabel *image3 = [[UILabel alloc] init];
        image3.backgroundColor = [self randomColor];
        image3.layer.borderColor = [UIColor blackColor].CGColor;
        image3.layer.borderWidth = 2;
        image3.layer.cornerRadius = 10;
        image3.layer.masksToBounds = YES;
        image3.text = @"Image 3";
        [self addSubview:image3];
        image3.textAlignment = NSTextAlignmentCenter;
        
        [image1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.bottom).offset(padding);
            make.left.equalTo(self.left).offset(padding);
            make.right.equalTo(self.right).offset(-padding);
            make.height.equalTo(145);
        }];
        
        
        [image2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(image1.bottom).offset(padding);
            make.left.equalTo(self.left).offset(padding);
            make.width.equalTo(image3.width);
            make.height.equalTo(image3.height);
        }];
        
        
        [image3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(image1.bottom).offset(padding);
            make.left.equalTo(image2.right).offset(padding);
            make.right.equalTo(self.right).offset(-padding);
            make.bottom.equalTo(self.bottom).offset(-padding);
            make.width.equalTo(image2.width);
            make.height.equalTo(image2.height);
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
