//
//  PRVTorchatConfig.m
//  prive-ios-tor
//
//  Created by Ivan Doroshenko on 11/6/13.
//  Copyright (c) 2013 Prive. All rights reserved.
//

#import "PRVTorchatConfig.h"

@implementation PRVTorchatConfig {
    NSString *_torAddress;
    uint16_t _torPort;
    NSMutableArray *_buddies;
}

- (id)init {
    self = [super init];
    if (self) {
        _buddies = [[NSMutableArray alloc] initWithCapacity:0];
        
        [self addBuddy:@"ktgja5s4ddmtbyyj" alias:@"mac" notes:@""];
    }
    
    return self;
}

- (NSString *)torAddress {
    return @"localhost";
}

- (uint16_t)torPort {
    return 9050;
}

- (UIImage *)profileAvatar {
    return nil;
}

- (NSString *)profileName {
    return @"localuser";
}

- (NSString *)profileText {
    return @"local profile description";
}

- (NSArray *)buddies {
    return _buddies;
}

- (NSArray *)blockedBuddies {
    return nil;
}

- (NSString *)selfAddress {
    return @"jslm3dtkljagftqm";
}

- (uint16_t)clientPort {
    return 11009;
}

- (NSString *)clientName:(tc_config_get)get {
    return @"Prive-iOS";
}

- (NSString *)clientVersion:(tc_config_get)get {
    return @"0.1alpha";
}

- (void)addBuddy:(NSString *)address alias:(NSString *)alias notes:(NSString *)notes {
    NSMutableDictionary *buddy = [[NSMutableDictionary alloc] init];
	
	[buddy setObject:address forKey:TCConfigBuddyAddress];
	[buddy setObject:alias forKey:TCConfigBuddyAlias];
	[buddy setObject:notes forKey:TCConfigBuddyNotes];
	[buddy setObject:@"" forKey:TCConfigBuddyLastName];
	
	[_buddies addObject:buddy];
}

- (void)setBuddy:(NSString *)address lastProfileName:(NSString *)lastName {
    
}

- (void)setBuddy:(NSString *)address lastProfileAvatar:(UIImage *)lastAvatar {
    
}

- (void)setBuddy:(NSString *)address lastProfileText:(NSString *)lastText {
    
}

// -- Localization --
- (NSString *)localized:(NSString *)key
{
	NSString *local = nil;
	
	if (!key)
		return @"";
	
	local = NSLocalizedString(key, @"");
	
	if ([local length] == 0)
		return key;
	
	return local;
}

@end
