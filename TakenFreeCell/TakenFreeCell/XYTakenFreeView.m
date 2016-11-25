//
//  XYTakenFreeTableViewCell.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/25/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "XYTakenFreeView.h"

@interface XYTakenFreeView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIView *frontgroundView;

@end

@implementation XYTakenFreeView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UIImage *backgroundImage = [UIImage imageNamed:@"invest_taken_free"];
    //拉伸Image
    backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(backgroundImage.size.height/2, 140, backgroundImage.size.height/2, 120) resizingMode:UIImageResizingModeStretch];
    self.backgroundImageView.image = backgroundImage;
    
   self.timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self startAnimation];
    }];
    
}


- (void)bindData:(id)data{
    [self.timer invalidate];
    
    
    
}



- (void)startAnimation{
    CGRect initialFrame = self.frontgroundView.frame;
    CGRect animationFrame = initialFrame;
    animationFrame.origin.y -= animationFrame.size.height;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.frontgroundView.frame = animationFrame;
    } completion:^(BOOL finished) {
    
        
        [UIView animateWithDuration:0.5 animations:^{
            self.frontgroundView.frame = initialFrame;
        } completion:^(BOOL finished) {
            //启动动画
            self.timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
                [self startAnimation];
            }];
        }];
        
    }];
}

@end
