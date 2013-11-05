//
//  ViewController.m
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/4/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#if !(TARGET_IPHONE_SIMULATOR)
#import "HITorManager.h"
#endif

@interface ViewController ()

@end

@implementation ViewController {
    AFHTTPSessionManager *_manager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *proxySettings = @{(NSString *)kCFStreamPropertySOCKSProxyHost: @"127.0.0.1",
                                    (NSString *)kCFStreamPropertySOCKSProxyPort : @(9150)};
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    configuration.connectionProxyDictionary = proxySettings;
    
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSURL *baseURL = [NSURL URLWithString:@"http://afnjyo25ohyp3v5g.onion"];
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    _manager.responseSerializer = serializer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startTor:(id)sender {
#if !(TARGET_IPHONE_SIMULATOR)
    [[HITorManager defaultManager] start];
#else
    NSLog(@"You are running on Suimulator -- use host Tor proxy instead!");
#endif
    
}

- (IBAction)requestHTTP:(id)sender {
    [_manager GET:@"/" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Successfully fetched %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"HTTP connection error: %@", error);
    }];
}

@end
