//
//  PRVAsyncSocketDelegate.m
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/5/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "PRVAsyncSocketDelegate.h"

@implementation PRVAsyncSocketDelegate

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    NSLog(@"Socket did connect to host %@:%d",host, port);
}

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock {
    NSDictionary *proxySettings = @{(__bridge NSString *)kCFStreamPropertySOCKSProxyHost : @"127.0.0.1",
                                    (__bridge NSString *)kCFStreamPropertySOCKSProxyPort : @(9150)};
    
    
    CFWriteStreamRef stream = sock.getCFWriteStream;
    CFWriteStreamSetProperty(stream, kCFStreamPropertySOCKSProxy, (__bridge CFDictionaryRef)proxySettings);
    
    return YES;
}

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err {
    NSLog(@"Socket %@ will disconnecto with error: %@", sock, err);
}

@end
