//
//  memorizeAppDelegate.m
//  memorize
//
//  Created by yoshi on 2014/03/16.
//  Copyright (c) 2014年 yoshi. All rights reserved.
//

#import "memorizeAppDelegate.h"

@implementation memorizeAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)backButton:(id)sender {
    [_displayString setStringValue:@"aaa"];
    NSString *filePath = @"/Users/yoshi/Programming/test/test/test/data.csv";
    NSString *csvdata = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [csvdata componentsSeparatedByString:@"\n"];
    NSLog(@"lines count: %ld", lines.count);
    static int button1Count = 0;
#if 0
    for (NSString *row in lines) {
        // コンマで区切って配列に格納する
        NSArray *items = [row componentsSeparatedByString:@","];
        NSLog(@"%@", items);
    }
#endif
    NSArray *items = [lines[button1Count] componentsSeparatedByString:@","];
    NSLog(@"%@", items[0]);
    if( button1Count < [lines count] - 1){
        button1Count++;
    }else{
        button1Count = 0;
    }
}

- (IBAction)changeButton:(id)sender {
}

- (IBAction)nextButton:(id)sender {
}
@end
