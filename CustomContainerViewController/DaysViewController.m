//
//  DaysViewController.m
//  CustomContainerViewController
//
//  Created by test on 9/27/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "DaysViewController.h"
#import "DayOfTheWeekCollectionViewCell.h"

@interface DaysViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSArray *days;


@end

@implementation DaysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.days=[[NSArray alloc]initWithObjects:@"Table",@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DayOfTheWeekCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"dayOfTheWeek" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor brownColor];
    cell.dayLabel.textColor=[UIColor groupTableViewBackgroundColor];
    cell.layer.cornerRadius=5;
    cell.clipsToBounds=YES;
    [cell.dayLabel setText:[self.days objectAtIndex:indexPath.row]];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
