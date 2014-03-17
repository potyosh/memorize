//
//  memorizeAppDelegate.m
//  memorize
//
//  Created by yoshi on 2014/03/16.
//  Copyright (c) 2014年 yoshi. All rights reserved.
//

#import "memorizeAppDelegate.h"

@implementation memorizeAppDelegate

int button1Count = 0;
NSString *filePath = @"/Users/yoshi/Dropbox/English/english_words.csv";

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)backButton:(id)sender {
    NSString *csvdata = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [csvdata componentsSeparatedByString:@"\n"];
    NSLog(@"lines count: %ld", lines.count);
    if( button1Count > 0 ){
        button1Count--;
    }else{
        button1Count = (int)([lines count] - 1);
    }
    NSArray *items = [lines[button1Count] componentsSeparatedByString:@","];
    [_displayString setStringValue:items[0]];
    NSLog(@"%@", items[0]);
    

}

- (IBAction)changeButton:(id)sender {
}

- (IBAction)nextButton:(id)sender {
    NSString *csvdata = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [csvdata componentsSeparatedByString:@"\n"];
    NSLog(@"lines count: %ld", lines.count);
    if( button1Count < [lines count] - 1){
        button1Count++;
    }else{
        button1Count = 0;
    }
    NSArray *items = [lines[button1Count] componentsSeparatedByString:@","];
    [_displayString setStringValue:items[0]];
    NSLog(@"%@", items[0]);
    
}
@end
