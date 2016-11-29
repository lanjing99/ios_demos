//
//  ViewController.m
//  AnimationCompletionTest
//
//  Created by 陈文经 on 11/28/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secondView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)firstView{
    if(!_firstView){
        _firstView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        _firstView.backgroundColor = [UIColor blueColor];
    }
    return _firstView;
}

- (UIView *)secondView{
    if(!_secondView){
        _secondView = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 50, 50)];
        _secondView.backgroundColor = [UIColor blueColor];
    }
    return _secondView;
}

- (IBAction)buttonTouched:(id)sender {
   
    [UIView animateWithDuration:1.5 delay:0 options:0 animations:^{
        self.firstView.frame = [self frameByAddYOffset:self.firstView.frame];
    } completion:^(BOOL finished) {
        NSLog(@"first completed");
    }];
    
    [UIView animateWithDuration:1.5 delay:0 options:0 animations:^{
        self.secondView.frame = [self frameByAddYOffset:self.secondView.frame];
    } completion:^(BOOL finished) {
        NSLog(@"second completed");
    }];

}

- (CGRect)frameByAddYOffset:(CGRect)frame{
    CGRect result = frame;
    result.origin.y += 50;
    return result;
}
@end
