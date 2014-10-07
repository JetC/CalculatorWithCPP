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
@property CalculationModel *aCalculationModel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.aCalculationModel = new CalculationModel;
//    int Result;
//    Result = _aCalculationModel->ReturnANumber();
//    NSLog(@"%d",Result);
//    
//    const char *expression = "123456";
//    _aCalculationModel->CalculateExpression(expression, 6);
    
}

- (IBAction)numberPressed:(UIButton *)sender {
    
    [self addPressedContentToTextField:sender.titleLabel.text];
    
}

- (IBAction)operatorPressed:(UIButton *)sender {
    [self addPressedContentToTextField:sender.titleLabel.text];

}

- (IBAction)calculateResult:(UIButton *)sender {
    
    float result = 0;
    const char *expression = self.expressionField.text.UTF8String;
    int characterCount = (int)self.expressionField.text.length;
    result = self.aCalculationModel->CalculateExpression(expression, characterCount);

    if (result == LONG_MAX) {
        self.resultLabel.text = @"输入有误";
        return;
    }
    self.resultLabel.text = [NSString stringWithFormat:@"结果为：%g",result];
}

- (void)addPressedContentToTextField:(NSString *)pressedContent{
    
    self.expressionField.text = [NSString stringWithFormat:@"%@%@",self.expressionField.text,pressedContent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
