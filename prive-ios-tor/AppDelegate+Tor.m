//
//  AppDelegate+Tor.m
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/4/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "AppDelegate+Tor.h"

@implementation AppDelegate (Tor)

- (void)clearConfigFile {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *torConfPath = [@"~/Library/tor/torrc" stringByExpandingTildeInPath];
    
    NSError *error;
    if ([fm fileExistsAtPath:torConfPath]) {
        [fm removeItemAtPath:torConfPath error:&error];
    }

    if (error) {
        NSLog(@"Error while clearing tor config %@", error);
    }
}

- (void)copyTorConfigIfNeeded {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;
    
    NSString *torConfDir = [@"~/Library/tor" stringByExpandingTildeInPath];
    NSString *torConfPath = [@"~/Library/tor/torrc" stringByExpandingTildeInPath];
    NSString *torConfSamplePath = [[NSBundle mainBundle] pathForResource:@"torrc" ofType:nil];
    
    BOOL dir;
    if (![fm fileExistsAtPath:torConfDir isDirectory:&dir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:torConfDir withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    if (![fm fileExistsAtPath:torConfPath]) {
        [[NSFileManager defaultManager] copyItemAtPath:torConfSamplePath toPath:torConfPath error:&error];
    }
    
    if (error) {
        NSLog(@"Error while coping tor config %@", error);
    }
}

@end
