//
//  SaveDetailsViewController.m
//  CustomContainerViewController
//
//  Created by test on 9/27/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "SaveDetailsViewController.h"
#import "MyManager.h"

@interface SaveDetailsViewController ()
@property (strong, nonatomic) IBOutlet UITextField *subjectText;
@property (strong, nonatomic) IBOutlet UITextField *abbreviationText;

@end

@implementation SaveDetailsViewController
{
    int atIndex;
    MyManager *sharedMangaer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    sharedMangaer=[MyManager sharedManager];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)doneAction:(id)sender {
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    
    [sharedMangaer.TimeTableDetailsArray insertObject:self.subjectText.text atIndex:atIndex];
    NSLog(@"%@",sharedMangaer.TimeTableDetailsArray);
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}

-(void)itemNumberToBeInsert:(int)itemNo
{
    atIndex=itemNo;
}

@end
