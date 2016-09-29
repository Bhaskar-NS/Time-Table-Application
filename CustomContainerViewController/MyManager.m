//
//  MyManager.m
//  CustomContainerViewController
//
//  Created by test on 9/27/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "MyManager.h"

@implementation MyManager


+ (id)sharedManager {
    static MyManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.TimeTableDetailsArray = [[NSMutableArray alloc] initWithCapacity:105];
        
        for (int i =0; i<105; i++) {
            [self.TimeTableDetailsArray addObject:@" "];
        }
        [self populateTimingsInTable];
        
    }
    return self;
}




-(void)populateTimingsInTable
{
    
    //int k=0;
    [self.TimeTableDetailsArray insertObject:@"8:00 AM" atIndex:0];
    [self.TimeTableDetailsArray insertObject:@"9:00 AM" atIndex:7];
    [self.TimeTableDetailsArray insertObject:@"10:00 AM" atIndex:14];
    [self.TimeTableDetailsArray insertObject:@"11:00 AM" atIndex:21];
    [self.TimeTableDetailsArray insertObject:@"12:00 PM" atIndex:28];
    [self.TimeTableDetailsArray insertObject:@"1:00 PM" atIndex:35];
    [self.TimeTableDetailsArray insertObject:@"2:00 PM" atIndex:42];
    [self.TimeTableDetailsArray insertObject:@"3:00 PM" atIndex:49];
    [self.TimeTableDetailsArray insertObject:@"4:00 PM" atIndex:56];
    [self.TimeTableDetailsArray insertObject:@"5:00 PM" atIndex:63];
    [self.TimeTableDetailsArray insertObject:@"6:00 PM" atIndex:70];
    [self.TimeTableDetailsArray insertObject:@"7:00 PM" atIndex:77];
    [self.TimeTableDetailsArray insertObject:@"8:00 PM" atIndex:84];
    [self.TimeTableDetailsArray insertObject:@"9:00 PM" atIndex:91];
    [self.TimeTableDetailsArray insertObject:@"10:00 PM" atIndex:98];
    
    
    //    for (int j=1; j<=112; j*=7) {
    //
    //        [self.TimeTableDetailsArray insertObject:@"8:00 AM" atIndex:j];
    //
    //    }
    
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:self.TimeTableDetailsArray forKey:@"ContentArray"];
//    [defaults synchronize];
}
@end
