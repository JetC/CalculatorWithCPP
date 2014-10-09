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
    
    InputErrorAbnormalChar = 0,
    InputErrorLackOfOperator = 1,
    InputErrorTooManyOperator = 2,
    InputErrorNoInput = 3,
    InputErrorCountBelowZero = 4,
    InputErrorUnknown = 5
};

class CalculationModel{
    
public:
    
    float CalculateExpression(const char Expression[], int CharactersCountInExpression);
    
private:
    
    float ProcessingCalculation(long Numbers[], int NumbersCount, char Operators[], int OperatorsCount);
    BOOL isNumber(const char character);
    BOOL isOperator(const char character);
    BOOL isMultiplyOrDivisionSign(const char character);
    char makeSingleToNumber(const char character[], int characterCount);
    BOOL isAddingOperator(const char character);

    
    
    
};

//@end
