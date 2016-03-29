//
//  MainViewController.m
//  ArcLayerDemo
//
//  Created by zhanggenning on 16/3/29.
//  Copyright © 2016年 zhanggenning. All rights reserved.
//

#import "MainViewController.h"
#import "LoadingView.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet LoadingView *loadingVw;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)startEvent:(UIButton *)sender {
    
    [_loadingVw startAnimation];
    
}

@end
