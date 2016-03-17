//
//  ViewController.m
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "DemoViewController.h"
#import "WEDebugger.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WELog(@"Salut");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
