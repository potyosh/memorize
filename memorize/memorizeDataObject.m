//
//  memorizeDataObject.m
//  memorize
//
//  Created by yoshi on 2014/05/04.
//  Copyright (c) 2014年 yoshi. All rights reserved.
//

#import "memorizeDataObject.h"

@implementation memorizeDataObject
static memorizeDataObject *sharedData_ = nil;
@synthesize jsonFileURL;

//This object is generated with singleton pattern
+ (memorizeDataObject *)sharedManager{
    @synchronized(self){
        //For thread safe
        if (!sharedData_) {
            sharedData_ = [memorizeDataObject new];
        }
    }
    return sharedData_;
}
- (id)init
{
    self = [super init];
    if (self) {
        //Initialization
    }
    return self;
}
@end
