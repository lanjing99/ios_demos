//
//  ViewController.m
//  StringUTF8Encode
//
//  Created by lanjing on 14-1-6.
//  Copyright (c) 2014年 lanjing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NSString * originalString = @"http://prodics.153.cn:8903/service/encrypt/share.action?&product_version=6&province=35&city_code=3502&client_type=icity_ver&client_verion=25&channel_num=appstore&productType=&os_type=2&invitor=18906910280&imsi=71B4D566-F802-48F9-99F5-5408281B801D&mobile=18047746690&client_version=404&baseLine=400&content=&flag=1&client_type=icity_ver&shareType=1&sign=NK+5g0RWR7uqLQUQcbsNa8vXkOkyu3nkaMyX4yt6gGtnUinslMs06bZWOFtRAEiG&shareType=1&timestamp=1388991704582";
    
    
    NSString * originalString = @"NK+5g0RWR7uqLQUQcbsNa8vXkOkyu3nkaMyX4yt6gGtnUinslMs06bZWOFtRAEiG";
    NSString *utf8String = [originalString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (__bridge CFStringRef) originalString,
                                                                          nil,
                                                                          CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),
                                                                          kCFStringEncodingUTF8);
    
    NSString *string = @"NK%2B5g0RWR7uqLQUQcbsNa8vXkOkyu3nkaMyX4yt6gGtnUinslMs06bZWOFtRAEiG";
    NSString *utf8String1 = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
