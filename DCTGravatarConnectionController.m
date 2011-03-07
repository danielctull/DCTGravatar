/*
 DCTGravatarConnectionController.m
 DCTGravatar
 
 Created by Daniel Tull on 14.09.2010.
 
 
 
 Copyright (c) 2010 Daniel Tull. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "DCTGravatarConnectionController.h"
#import <CommonCrypto/CommonDigest.h>

@implementation DCTGravatarConnectionController

@synthesize size, gravatarID, gravatarHash;

- (void)dealloc {
    [size release], size = nil;
	[gravatarID release], gravatarID = nil;
	[gravatarHash release], gravatarHash = nil;
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
