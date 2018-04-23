//
//  ViewController.m
//  Line-Calculator
//
//  Created by Viktoryia Barzdyka on 4/22/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import "ViewController.h"
#import "LineCalculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LineCalculator *calc2 = [LineCalculator defaultValue:@2];
    [[calc2 add:@2] multiply:@2];
    NSLog(@"%@", calc2); // should be 6

    LineCalculator *calc3 = [LineCalculator defaultValue:@10];
    [calc3 add:@83]; //-> 93
    NSLog(@"%@", calc3);
    
    LineCalculator *calc4 = [LineCalculator defaultValue:@4];
    [[[[[[[[[calc4 pow:@1] pow:@1] pow:@1] multiply:@2] add:@80] subtract:@11] multiply:@1] subtract:@41] subtract:@65];// -> -29
    NSLog(@"%@", calc4);
    
    LineCalculator *calc5 = [LineCalculator defaultValue:@6];
    [[[[[[[calc5 add:@14] subtract:@16] add:@36] multiply:@1] subtract:@46] add:@57] pow:@1]; //-> 51
    NSLog(@"%@", calc5);
    
    LineCalculator *calc6 = [LineCalculator defaultValue:@10];
    [[calc6 pow:@1] pow:@1]; // -> 10
    NSLog(@"%@", calc6);

    LineCalculator *calc7 = [LineCalculator defaultValue:@7];
    [[[[[[[[calc7 subtract:@94] subtract:@97] multiply:@1] pow:@1] multiply:@1] pow:@1] subtract:@65] pow:@1]; //-> -249
    NSLog(@"%@", calc7);
    
    LineCalculator *calc8 = [LineCalculator defaultValue:@7];
    [[[[[[calc8 subtract:@43] subtract:@43] multiply:@1] subtract:@60] add:@8] subtract:@28];// -> -159
    NSLog(@"%@", calc8);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
