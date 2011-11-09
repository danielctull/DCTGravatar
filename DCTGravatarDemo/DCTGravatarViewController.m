//
//  DCTGravatarViewController.m
//  DCTGravatar
//
//  Created by Daniel Tull on 09.11.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTGravatarViewController.h"
#import "DCTGravatarConnectionController.h"
#import "DCTConnectionQueue+Singleton.h"

@implementation DCTGravatarViewController

@synthesize imageView;

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	DCTGravatarConnectionController *cc = [[DCTGravatarConnectionController alloc] init];
	cc.gravatarID = textField.text;
	cc.size = [NSNumber numberWithInteger:512];
	
	__weak DCTGravatarConnectionController *weakCC = cc;
	
	[cc addFinishHandler:^{
		
		id o = weakCC.returnedObject;
		
		if ([o isKindOfClass:[NSData class]])		
			self.imageView.image = [UIImage imageWithData:(NSData *)o];
		
	}];
	
	[cc connect];
	
	[textField resignFirstResponder];
	
	return YES;	
}

@end
