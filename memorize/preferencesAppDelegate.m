//
//  preferencesAppDelegate.m
//  memorize
//
//  Created by yoshi on 2014/04/03.
//  Copyright (c) 2014年 yoshi. All rights reserved.
//

#import "preferencesAppDelegate.h"

@implementation preferencesAppDelegate

- (IBAction)selectButton:(id)sender {
    //NSLog(@"aaa");
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    // Enable the selection of files in the dialog.
    [openDlg setCanChooseFiles:YES];
    
    // Enable the selection of directories in the dialog.
    [openDlg setCanChooseDirectories:YES];
    if( [openDlg runModal] == NSOKButton ){
        for( NSURL* URL in [openDlg URLs] )
        {
            NSLog( @"%@", [URL path] );
        }
    }
}
@end
