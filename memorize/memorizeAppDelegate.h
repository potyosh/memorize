//
//  memorizeAppDelegate.h
//  memorize
//
//  Created by yoshi on 2014/03/16.
//  Copyright (c) 2014年 yoshi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface memorizeAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *displayString;
- (IBAction)backButton:(id)sender;
- (IBAction)changeButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)mainMenuPreferences:(id)sender;

@end
