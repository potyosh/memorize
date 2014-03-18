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

enum EnDisplayState {
    EnDisplayStateQuestion,     //items[0]
    EnDisplayStateAnswer,       //items[1]
};

enum EnDisplayState enDisplayState = EnDisplayStateQuestion;
NSString *csvdata;
NSArray *lines;
NSArray *items;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    csvdata = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    lines = [csvdata componentsSeparatedByString:@"\n"];
}

- (IBAction)backButton:(id)sender {
    NSLog(@"lines count: %ld", lines.count);
    if( button1Count > 0 ){
        button1Count--;
    }else{
        button1Count = (int)([lines count] - 1);
    }
    items = [lines[button1Count] componentsSeparatedByString:@","];
    [_displayString setStringValue:items[0]];
    NSLog(@"%@", items[0]);
}

- (IBAction)changeButton:(id)sender {
    //Flip display
    if( enDisplayState == EnDisplayStateQuestion ){
        enDisplayState = EnDisplayStateAnswer;
    }else{
        enDisplayState = EnDisplayStateQuestion;
    }
    [_displayString setStringValue:items[enDisplayState]];
}

- (IBAction)nextButton:(id)sender {
    NSLog(@"lines count: %ld", lines.count);
    if( button1Count < [lines count] - 1){
        button1Count++;
    }else{
        button1Count = 0;
    }
    items = [lines[button1Count] componentsSeparatedByString:@","];
    [_displayString setStringValue:items[0]];
    NSLog(@"%@", items[0]);
}
@end
