//
//  CalculationModel.h
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <iostream>

enum InputError {
    
    InputErrorAbnormalChar,
    InputErrorLackOfOperator,
    InputErrorTooManyOperator,
    InputErrorUnknown
};

class CalculationModel{
    
public:
    
    long CalculateExpression(const char Expression[], int CharactersCountInExpression);
    
private:
    
    long ProcessingCalculation(long Numbers[], int NumbersCount, char Operators[], int OperatorsCount);
    BOOL isNumber(const char character);
    BOOL isOperator(const char character);
    BOOL isMultiplyOrDivisionSign(const char character);
    char makeSingleToNumber(const char character[], int characterCount);
    
    
    
    
};

//@end
