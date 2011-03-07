//
//  DCTGravatarAppDelegate.h
//  DCTGravatar
//
//  Created by Daniel Tull on 7.03.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCTGravatarAppDelegate : NSObject <UIApplicationDelegate, UITextFieldDelegate> {}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
