//
//  ViewController.m
//  AFNetworkingMemoryTest
//
//  Created by 陈文经 on 11/23/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "TestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouched:(UIButton *)sender {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    NSDictionary *params = @{@"version":@"3.5.0"};
    [manager GET:@"https://www.xiaoying.com/api/apiPublic/getAppHomeData11" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"download process is %f", downloadProgress.completedUnitCount/(float)downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"download Success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"download Failed");
    }];
    
//    [manager invalidateSessionCancelingTasks:YES];
}

@end
