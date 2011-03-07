//
//  DCTGravatarAppDelegate.m
//  DCTGravatar
//
//  Created by Daniel Tull on 7.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGravatarAppDelegate.h"

@implementation DCTGravatarAppDelegate

@synthesize window, imageView, textField;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
	[window release], window = nil;
	[imageView release], imageView = nil;
	[textField release], textField = nil;
    [super dealloc];
}

@end
