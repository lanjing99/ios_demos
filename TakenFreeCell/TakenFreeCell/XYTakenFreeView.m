//
//  XYTakenFreeTableViewCell.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/25/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "XYTakenFreeView.h"
#import "UIView+RoundCorners.h"
#import "NSString+AttributeNumbers.h"

@interface XYTakenFreeView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UILabel *backgroundTopTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *backgroundMiddleTitleLabel;

@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIView *frontgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundTopTitleLabelWidthConstraint;

@end

@implementation XYTakenFreeView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UIImage *backgroundImage = [UIImage imageNamed:@"invest_taken_free"];
    //拉伸Image
    backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(backgroundImage.size.height/2, 148, backgroundImage.size.height/2, 132) resizingMode:UIImageResizingModeStretch];
    self.backgroundImageView.image = backgroundImage;
    
   self.timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self startAnimation];
    }];
    
    self.clipsToBounds = YES;
    [self.imageView xy_setRoundCorners:UIRectCornerBottomRight withRadius:49/2.0];
    [self.backgroundTopTitleLabel xy_setRoundCorners:UIRectCornerAllCorners withRadius:self.backgroundTopTitleLabel.bounds.size.height/2];
    [self.backgroundMiddleTitleLabel xy_setRoundCorners:UIRectCornerAllCorners withRadius:self.backgroundMiddleTitleLabel.bounds.size.height/2];
//    self.backgroundTopTitleLabel.layer.cornerRadius = 10;
//    self.backgroundTopTitleLabel.clipsToBounds = YES;
    
    
    NSDictionary *digitAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor], };
    NSDictionary *otherAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:11], NSForegroundColorAttributeName:[UIColor whiteColor], };
    
    NSAttributedString *attributeString = [self.topTitleLabel.text xy_attributeStringWithDigitsAttributes:digitAttribute andOthersAttributes:otherAttribute];
    self.topTitleLabel.attributedText = attributeString;
    CGSize size = [attributeString size];
    self.backgroundTopTitleLabelWidthConstraint.constant =  size.width + 20;
//    self.backgroundTopTitleLabelWidthConstraint.constant = 0;
//    [self.backgroundTopTitleLabel setNeedsUpdateConstraints];
//    [self setNeedsUpdateConstraints];
}


- (void)bindData:(id)data{
    [self.timer invalidate];
    
    
    
}



- (void)startAnimation{
    
//    CGSize size = [self.topTitleLabel.attributedText size];
//    self.backgroundTopTitleLabelWidthConstraint.constant = size.width + 20;
//    [self setNeedsUpdateConstraints];
//    [self setNeedsLayout];
    
    CGRect initialFrame = self.frontgroundView.frame;
    CGRect animationFrame = initialFrame;
    animationFrame.origin.y -= animationFrame.size.height;
    
    [UIView animateWithDuration:0.35 animations:^{
        
        self.frontgroundView.frame = animationFrame;
        self.frontgroundView.alpha = 0;
    } completion:^(BOOL finished) {
    
        
        [UIView animateWithDuration:0.3 animations:^{
            self.frontgroundView.frame = initialFrame;
            self.frontgroundView.alpha = 1.0;
        } completion:^(BOOL finished) {
            //启动动画
            self.timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
                [self startAnimation];
            }];
        }];
        
    }];
}

@end
