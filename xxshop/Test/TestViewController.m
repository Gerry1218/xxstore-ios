//
//  TestViewController.m
//  xxshop
//
//  Created by Gerry on 2023/5/4.
//

#import "TestViewController.h"
#import "RNTestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)go2RNTestPage:(id)sender {
    RNTestViewController *vc = [RNTestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
