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
@property (weak, nonatomic) IBOutlet UITextField *expressionField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CalculationModel *aCalculationModel = new CalculationModel;
    int Result;
    Result = aCalculationModel->ReturnANumber();
    NSLog(@"%d",Result);
    
    const char *expression = "123456";
    aCalculationModel->CalculateExpression(expression, 6);
    
}

- (IBAction)numberPressed:(UIButton *)sender {
    
    self.expressionField.text = [NSString stringWithFormat:@"%@%@",self.expressionField.text,sender.titleLabel.text];
    
}

- (IBAction)operatorPressed:(UIButton *)sender {
    
    
}

- (IBAction)calculateResult:(id)sender {
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
