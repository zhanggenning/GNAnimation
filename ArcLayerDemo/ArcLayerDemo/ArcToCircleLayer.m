//
//  ArcToCircleLayer.m
//  ArcLayerDemo
//
//  Created by zhanggenning on 16/3/29.
//  Copyright © 2016年 zhanggenning. All rights reserved.
//

#import "ArcToCircleLayer.h"

static CGFloat const kLineWidth = 6;

@implementation ArcToCircleLayer

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

-(void)drawInContext:(CGContextRef)ctx
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat radius = MIN(CGRectGetWidth(self.bounds), (CGRectGetHeight(self.bounds) - kLineWidth)/2);
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat originStart = M_PI * 7 / 2;
    CGFloat originEnd = M_PI * 2;
    CGFloat currentOrigin = originStart - (originStart - originEnd) * self.progress;
    
    CGFloat destStart = M_PI * 3;
    CGFloat destEnd = 0;
    CGFloat currentDest = destStart - (destStart - destEnd) * self.progress;
    
    
    [path addArcWithCenter:center radius:radius startAngle:currentOrigin endAngle:currentDest clockwise:NO];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, kLineWidth);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextStrokePath(ctx);
}

@end
