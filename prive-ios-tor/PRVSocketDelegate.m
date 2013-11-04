//
//  PRVSocketDelegate.m
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/4/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "PRVSocketDelegate.h"

@implementation PRVSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    NSLog(@"Connection accepted sending echo %@", newSocket);
    NSData *helloData = [@"HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\n Hello!\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [newSocket writeData:helloData withTimeout:10.0f tag:0];
    [newSocket disconnectAfterWriting];
}

@end
