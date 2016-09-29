//
//  MyManager.h
//  CustomContainerViewController
//
//  Created by test on 9/27/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyManager : NSObject


@property (nonatomic, retain) NSMutableArray *TimeTableDetailsArray;

+ (id)sharedManager;


@end
