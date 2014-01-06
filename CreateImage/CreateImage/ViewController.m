//
//  ViewController.m
//  CreateImage
//
//  Created by lanjing on 13-12-25.
//  Copyright (c) 2013年 lanjing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(UIImage *)createImageWithSize:(CGSize) size backgroundColor:(UIColor *) color imageRect:(CGRect) imageRect image:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color set];
    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextFillPath(context);
    
    
    [image drawInRect:imageRect];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return resultImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIImage *sample = [UIImage imageNamed:@"sample"];
    
    CGRect frame = CGRectMake(0, 80, 320, 160);
    CGSize sampleSize = sample.size;
    CGRect sampleFrame = CGRectMake((frame.size.width - sampleSize.width)/2, (frame.size.height - sampleSize.height)/2, sampleSize.width, sampleSize.height);
    UIColor *backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: frame];
    UIImage *sampleInRect = [self createImageWithSize:frame.size backgroundColor:backgroundColor imageRect:sampleFrame image:sample];
    imageView.image = sampleInRect;
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
