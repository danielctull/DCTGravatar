//
//  DCTGravatarAppDelegate.m
//  DCTGravatar
//
//  Created by Daniel Tull on 7.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGravatarAppDelegate.h"
#import "DCTGravatarConnectionController.h"

@implementation DCTGravatarAppDelegate

@synthesize window, imageView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	DCTGravatarConnectionController *cc = [DCTGravatarConnectionController connectionController];
	cc.gravatarID = textField.text;
	cc.size = [NSNumber numberWithInteger:512];
	
	[cc addCompletionBlock:^(NSObject *o) {
		
		if ([o isKindOfClass:[NSData class]])		
			self.imageView.image = [UIImage imageWithData:(NSData *)o];
		
	}];
	
	[cc connect];
	
	[textField resignFirstResponder];
	
	return YES;	
}

- (void)dealloc {
	[window release], window = nil;
	[imageView release], imageView = nil;
    [super dealloc];
}

@end
