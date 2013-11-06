//
//  AppDelegate.m
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/4/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Tor.h"
#import "GCDAsyncSocket.h"
#import "PRVGCDSocketDelegate.h"
#import "AsyncSocket.h"
#import "PRVAsyncSocketDelegate.h"

@implementation AppDelegate {
    PRVGCDSocketDelegate *_delegate;
    PRVAsyncSocketDelegate *_runLoopDelegate;
    GCDAsyncSocket *_socket;
    AsyncSocket *_runLoopSocket;
}

- (void)startHelloSocketService {
    _delegate = [[PRVGCDSocketDelegate alloc] init];
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:_delegate delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    NSError *error;
    [_socket acceptOnPort:9999 error:&error];
}

- (void)connectTestSocket {
    _runLoopDelegate = [[PRVAsyncSocketDelegate alloc] init];
    _runLoopSocket = [[AsyncSocket alloc] initWithDelegate:_runLoopDelegate];   
    
    NSError *error;
    [_runLoopSocket connectToHost:@"afnjyo25ohyp3v5g.onion" onPort:80 error:&error];
    //[_runLoopSocket connectToHost:@"priveim.com" onPort:80 error:&error];
    if (error) {
        NSLog(@"Async socket connection error: %@", error);
    }
}

- (void)startManager {

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#if !(TARGET_IPHONE_SIMULATOR)
    [self startHelloSocketService];
#ifdef DEBUG
    [self clearConfigFile];
#endif
    [self copyTorConfigIfNeeded];
#endif
    
    //[self connectTestSocket];
    
    //
    
    NSString *s = [NSString stringWithContentsOfFile:[@"~/Library/tor/hostname" stringByExpandingTildeInPath] encoding:NSASCIIStringEncoding error:nil];
    NSLog(@"Hidden service hostname: %@",s);
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
