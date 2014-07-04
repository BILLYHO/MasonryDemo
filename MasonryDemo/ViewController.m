//
//  ViewController.m
//  MasonryDemo
//
//  Created by billy.ho on 7/3/14.
//  Copyright (c) 2014 BILLYHO. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"ScrollView";
    self.view = [[ScrollView alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
