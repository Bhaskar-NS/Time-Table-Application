//
//  TimeTableDetailsCollectionViewCell.m
//  CustomContainerViewController
//
//  Created by test on 9/27/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "TimeTableDetailsCollectionViewCell.h"

@implementation TimeTableDetailsCollectionViewCell


-(void)prepareForReuse
{
    self.contentLabel.text=nil;
    
    [super prepareForReuse];
}
@end
