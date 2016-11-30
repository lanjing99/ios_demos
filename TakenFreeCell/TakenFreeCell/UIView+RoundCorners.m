//
//  UIView+RoundCorners.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/29/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "UIView+RoundCorners.h"

@implementation UIView(RoundCorners)

//注意，使用UIBezierPath设置完不同的圆角时，当视图的大小改变时，需要重新设置一次。
//所以，当设同时置4个角时，还是使用layer.cornerRadius属性。
- (void)xy_setRoundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius{
    if(corners == 0 || radius == 0) return;
    
    if(corners == UIRectCornerAllCorners){
        self.layer.cornerRadius = radius;
    }else{
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        self.layer.mask = shape;
    }
    self.clipsToBounds = YES;
}

@end
