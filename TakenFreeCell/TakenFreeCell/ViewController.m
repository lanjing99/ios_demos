//
//  ViewController.m
//  TakenFreeCell
//
//  Created by 陈文经 on 11/25/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "ViewController.h"
#import "XYTakenFreeView.h"
#import "NSString+AttributeNumbers.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XYTakenFreeView *cell = nil; //[[XYTakenFreeTableViewCell alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 250)];
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"XYTakenFreeView" owner:nil options:nil];
    cell = array.firstObject;
    cell.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100);
    [self.view addSubview:cell];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 50)];
    NSString *text = @"this is +19.84 and 2000%";
    
    NSDictionary *digitAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:30], NSForegroundColorAttributeName:[UIColor redColor], };
    NSDictionary *otherAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor redColor], };
    NSAttributedString *attributeString = [text xy_attributeStringWithDigitsAttributes:digitAttribute andOthersAttributes:otherAttribute];
    label.attributedText = attributeString;
    [self.view addSubview:label];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
