//
//  ViewController.m
//  TestBlockReference
//
//  Created by ys on 16/3/30.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

typedef void (^Block) (int);

@interface ViewController ()

@property (nonatomic, copy) Block block;

@property (nonatomic, assign) int x;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%ld", self.retainCount);
    
    
    typeof(self) __block weakSelf = self;
    self.block = ^ (int i) {
        weakSelf.x = i;
    };
    
    NSLog(@"%ld", self.retainCount);
    
    self.block(1);
    
    NSLog(@"%ld", self.retainCount);
    
    self.block(self.x);
    
    NSLog(@"%ld", self.retainCount);
}

@end
