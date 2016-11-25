//
//  ViewController.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/25/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "ViewController.h"
#import "XYTakenFreeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XYTakenFreeView *cell = nil; //[[XYTakenFreeTableViewCell alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 250)];
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"XYTakenFreeView" owner:nil options:nil];
    cell = array.firstObject;
    cell.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 150);
    [self.view addSubview:cell];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
