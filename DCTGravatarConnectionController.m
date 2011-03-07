//
//  DCTGravatarConnectionController.m
//  DCTGravatar
//
//  Created by Daniel Tull on 14.09.2010.
//  Copyright (c) 2010 Daniel Tull. All rights reserved.
//

#import "DCTGravatarConnectionController.h"


@implementation DCTGravatarConnectionController

@synthesize size, gravatarID;

- (void)dealloc {
    [size release], size = nil;
	[gravatarID release], gravatarID = nil;
    [super dealloc];
}

+ (NSArray *)queryProperties {
	return [NSArray arrayWithObject:@"size"];
}

- (NSString *)baseURLString {
	return [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@", self.gravatarID];	
}


@end
