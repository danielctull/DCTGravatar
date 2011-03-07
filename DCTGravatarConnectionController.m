//
//  DCTGravatarConnectionController.m
//  DCTGravatar
//
//  Created by Daniel Tull on 14.09.2010.
//  Copyright (c) 2010 Daniel Tull. All rights reserved.
//

#import "DCTGravatarConnectionController.h"
#import "NSString+DCTURLEncoding.h"
#import <CommonCrypto/CommonDigest.h>

@implementation DCTGravatarConnectionController

@synthesize size, gravatarID, gravatarHash;

- (void)dealloc {
    [size release], size = nil;
	[gravatarID release], gravatarID = nil;
    [super dealloc];
}

+ (NSArray *)queryProperties {
	return [NSArray arrayWithObject:@"size"];
}

- (NSString *)baseURLString {
	return [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@", self.gravatarHash];	
}

- (NSString *)gravatarHash {
	
	if (!(gravatarHash)) {
		
		NSString *noSpacesString = [self.gravatarID stringByReplacingOccurrencesOfString:@" " withString:@""];
		NSString *lowerCaseString = [noSpacesString lowercaseString];
		
		const char *cStr = [lowerCaseString UTF8String];
		unsigned char result[CC_MD5_DIGEST_LENGTH];
		
		CC_MD5( cStr, strlen(cStr), result );
		
		NSMutableString *str = [[NSMutableString alloc] initWithCapacity: 33];
		
		for (NSInteger i = 0; i < 16; i++) 
			[str appendFormat: @"%02x", result[i]];
		
		self.gravatarHash = str;

		[str release];
	}
	
	return gravatarHash;
}

@end
