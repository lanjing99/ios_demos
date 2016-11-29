//
//  UIView+RoundCorners.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/29/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "UIView+RoundCorners.h"

@implementation UIView(RoundCorners)

- (void)xy_setRoundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius{
    if(corners == 0 || radius == 0) return;
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
    self.clipsToBounds = YES;
}

@end
