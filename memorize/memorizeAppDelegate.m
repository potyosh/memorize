//
//  memorizeAppDelegate.m
//  memorize
//
//  Created by yoshi on 2014/03/16.
//  Copyright (c) 2014年 yoshi. All rights reserved.
//

#import "memorizeAppDelegate.h"

@implementation memorizeAppDelegate

int buttonCount = 0;
NSString *filePath = @"/Users/yoshi/Dropbox/English/english_words.json";
NSWindowController *controllerWindow;

typedef enum {
    DISP_STATE_TYPE_ENGLISH = 0,
    DISP_STATE_TYPE_JAPANESE = 1,
} dispStateTypes;

dispStateTypes dispStateType = DISP_STATE_TYPE_ENGLISH;
NSString *jsondata;
NSData *jsonData;
NSArray *array;
NSDictionary *obj;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSError *error;
    // Insert code here to initialize your application
    jsondata = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    jsonData = [jsondata dataUsingEncoding:NSUnicodeStringEncoding];
    
    // convert JSON to array
    array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingAllowFragments
                                                       error:&error];
}

- (IBAction)backButton:(id)sender {
    if( buttonCount > 0 ){
        buttonCount--;
    }else{
        buttonCount = (int)[array count] - 1;
    }
    obj = array[buttonCount];
    //Display
    [_displayString setStringValue:[obj objectForKey:@"english"]   ];
}

- (IBAction)changeButton:(id)sender {
    //Flip display
    if( dispStateType == DISP_STATE_TYPE_ENGLISH ){
        dispStateType = DISP_STATE_TYPE_JAPANESE;
    }else{
        dispStateType = DISP_STATE_TYPE_ENGLISH;
    }
    //Display
    if( dispStateType == DISP_STATE_TYPE_ENGLISH ){
        [_displayString setStringValue:[obj objectForKey:@"english"]   ];
    }else{
        [_displayString setStringValue:[obj objectForKey:@"japanese"]   ];
    }
}

- (IBAction)nextButton:(id)sender {
    if( buttonCount < [array count] - 1){
        buttonCount++;
    }else{
        buttonCount = 0;
    }
    obj = array[buttonCount];
    //Display
    [_displayString setStringValue:[obj objectForKey:@"english"]   ];
}

- (IBAction)mainMenuPreferences:(id)sender {
    controllerWindow = [[NSWindowController alloc] initWithWindowNibName:@"Preferences"];
    [controllerWindow showWindow:self];
}
@end
