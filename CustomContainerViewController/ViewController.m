//
//  ViewController.m
//  CustomContainerViewController
//
//  Created by test on 9/27/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "ViewController.h"
#import "DaysViewController.h"
#import "TimeTableDetailsCollectionViewCell.h"
#import "SaveDetailsViewController.h"
#import "MyManager.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewOutlet;


@property (strong, nonatomic) IBOutlet UIView *currentClientView;


@property (strong,nonatomic) NSUserDefaults *defaults;

@property (strong,nonatomic) NSArray *toPopulate;

@end

@implementation ViewController
{
    int multiple;
    MyManager *sharedManager;
    DaysViewController *vc;
    int itemNo;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    sharedManager.TimeTableDetailsArray=[self.defaults valueForKey:@"ContentArray"];
//    NSLog(@"%@",[self.defaults valueForKey:@"ContentArray"]);
//    if ([self.defaults objectForKey:@"ContentArray"] == nil) {
//        sharedManager = [MyManager sharedManager];
//    }
//    else
//    {
//        //sharedManager = [MyManager sharedManager];
//        sharedManager.TimeTableDetailsArray=[self.defaults valueForKey:@"ContentArray"];
//        NSLog(@"%@",sharedManager.TimeTableDetailsArray);
//    }
    sharedManager = [MyManager sharedManager];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"ContentArray"] == nil) {
        
        }
    else{

        sharedManager.TimeTableDetailsArray=[[defaults valueForKey:@"ContentArray"] mutableCopy];
    }
    
    
    
    
    //NSLog(@"%@",sharedManager.TimeTableDetailsArray);
    vc=[[DaysViewController alloc] init];
    [self displayContentController:vc];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayContentController: (UIViewController*) content {
    
    //if ([content isKindOfClass:[DaysViewController class]]) {
        
        [self addChildViewController:content];
        [self.view addSubview:self.currentClientView];
        [content didMoveToParentViewController:self];

//    //}
//    //else
//    //{
//        self.saveView.hidden=NO;
//        [self addChildViewController:content];
//        [self.view addSubview:self.saveView];
//        [content didMoveToParentViewController:self];
//    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 105;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TimeTableDetailsCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"topic" forIndexPath:indexPath];

    //TimeTableDetailsCollectionViewCell *cell=[[UICollectionView alloc] init];
    
    cell.layer.cornerRadius=5;
    cell.clipsToBounds=YES;
    [cell prepareForReuse];
    cell.backgroundColor=[UIColor lightGrayColor];
    
    if (indexPath.row==0 || indexPath.row % 7 == 0) {
        
        //cell.backgroundColor=[UIColor colorWithHue:2.0 saturation:1.05 brightness:99 alpha:7.0];
        
        cell.backgroundColor=[UIColor brownColor];
        cell.contentLabel.textColor=[UIColor groupTableViewBackgroundColor];
    }
    
    cell.contentLabel.text=[sharedManager.TimeTableDetailsArray objectAtIndex:indexPath.row];
    
    
    
    
    
    return cell;
}


-(void)viewWillAppear:(BOOL)animated
{
    
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

//    itemNo=(int)indexPath.row;
//    [self performSegueWithIdentifier:@"enterDetails" sender:self];

    UIAlertController *controller=[UIAlertController alertControllerWithTitle:@"ADD" message:@"Enter Subject Name" preferredStyle:UIAlertControllerStyleAlert];
    [controller addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Subject";
    }];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *login = controller.textFields.firstObject;
        
        
        
        [self.collectionViewOutlet performBatchUpdates:^{
            
            
            //[sharedManager.TimeTableDetailsArray insertObject:login.text atIndex:indexPath.row];
            
            [sharedManager.TimeTableDetailsArray replaceObjectAtIndex:indexPath.row withObject:login.text];
            NSArray *itemPaths=[self.collectionViewOutlet indexPathsForSelectedItems];
            [self.collectionViewOutlet reloadItemsAtIndexPaths:itemPaths];
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setValue:sharedManager.TimeTableDetailsArray forKey:@"ContentArray"];
            [self.defaults synchronize];
           // NSLog(@"%@",[itemPaths valueForKey:@"path"]);
        } completion:nil];
    }];
    
    [controller addAction:ok];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}











@end
