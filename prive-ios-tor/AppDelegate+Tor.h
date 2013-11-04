//
//  AppDelegate+Tor.h
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/4/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Tor)

- (void)clearConfigFile;
- (void)copyTorConfigIfNeeded;

@end
