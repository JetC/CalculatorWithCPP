//
//  ViewController.m
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import "ViewController.h"
#import "CalculationModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CalculationModel *aCalculationModel = new CalculationModel;
    int number;
    number = aCalculationModel->ReturnANumber();
    NSLog(@"%d",number);
    
    const char *expression = "123456";
    aCalculationModel->CalculateExpression(expression, 7);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
