//
//  LoadingView.m
//  ArcLayerDemo
//
//  Created by zhanggenning on 16/3/29.
//  Copyright © 2016年 zhanggenning. All rights reserved.
//

#import "LoadingView.h"
#import "ArcToCircleLayer.h"

static CGFloat const kRadius = 40;
static CGFloat const kLineWidth = 6;
static CGFloat const kStep1Duration = 5.0;

@interface LoadingView ()

@property (nonatomic, strong) ArcToCircleLayer *arcToCircleLayer;

@end

@implementation LoadingView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)startAnimation
{
    [self reset];
    [self doStep];
}

- (void)reset
{
    [self.arcToCircleLayer removeFromSuperlayer];
}

- (void)doStep
{
    self.arcToCircleLayer = [ArcToCircleLayer layer];
    self.arcToCircleLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:self.arcToCircleLayer];
    
    self.arcToCircleLayer.bounds = CGRectMake(0, 0, kRadius * 2 + kLineWidth, kRadius * 2 + kLineWidth);
    self.arcToCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    self.arcToCircleLayer.progress = 1;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = kStep1Duration;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    [self.arcToCircleLayer addAnimation:animation forKey:nil];
}

@end
