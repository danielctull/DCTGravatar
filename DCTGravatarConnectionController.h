//
//  DCTGravatarConnectionController.h
//  DCTGravatar
//
//  Created by Daniel Tull on 14.09.2010.
//  Copyright (c) 2010 Daniel Tull. All rights reserved.
//

#import "DCTRESTController.h"


@interface DCTGravatarConnectionController : DCTRESTController {

}

@property (nonatomic, retain) NSNumber *size;
@property (nonatomic, copy) NSString *gravatarID;
@property (nonatomic, copy) NSString *gravatarHash;

@end
