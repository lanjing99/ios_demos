//
//  XYTakenFreeTableViewCell.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/25/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "XYTakenFreeTableViewCell.h"

@interface XYTakenFreeTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation XYTakenFreeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UIImage *backgroundImage = [UIImage imageNamed:@"invest_taken_free"];
    //拉伸Image
    backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(backgroundImage.size.height/2, 130, backgroundImage.size.height/2, 120) resizingMode:UIImageResizingModeStretch];
    self.backgroundImageView.image = backgroundImage;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
