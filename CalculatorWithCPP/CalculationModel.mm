//
//  CalculationModel.m
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#include "CalculationModel.h"

float CalculationModel::CalculateExpression(const char Expression[], int CharactersCountInExpression)
{
    float Result = 0;
    //打印输入内容
    printf("This time inputed into CPP:\n");
    long Numbers[100];
    char Operators[20];
    char SingleNumber[10];
    int SingleNumberIndex = 0;
    int NumbersIndex = 0;
    int OperatorsIndex = 0;
    
    for (int i = 0; i < CharactersCountInExpression; i++) {
        
        //将单个字符加入SingleNumber (没到达最后一个字符时)
        if (isNumber(Expression[i]) &&
            i != CharactersCountInExpression-1) {
            
            SingleNumber[SingleNumberIndex] = Expression[i];
            SingleNumberIndex++;
        }
        //把运算符加入Operators
        else if (isOperator(Expression[i]) &&
                 i > 0 &&
                 i != CharactersCountInExpression-1 ){
            
            //SingleNumber转为long的数字
            Numbers[NumbersIndex] = strtol(SingleNumber, NULL, 10);
            printf("Number:%ld\n",Numbers[NumbersIndex]);
            NumbersIndex++;
            
            //复位SingleNumber
            memset(SingleNumber, 0,strlen(SingleNumber));
            SingleNumberIndex = 0;
            
            Operators[OperatorsIndex] = Expression[i];
            OperatorsIndex++;
        }
        //当到达最后一个字符且其是数字时
        else if (i == CharactersCountInExpression-1 &&
                 isNumber(Expression[i])){
            
            SingleNumber[SingleNumberIndex] = Expression[i];
            SingleNumberIndex++;
            
            Numbers[NumbersIndex] = strtol(SingleNumber, NULL, 10);
            printf("Number:%ld\n",Numbers[NumbersIndex]);
            NumbersIndex++;
        }
        else{
            printf("Error, You entered :%c",Expression[i]);
            try{
                throw InputErrorAbnormalChar;
            }
            catch (InputError& Error) {
                if (Error == InputErrorAbnormalChar) {
                    printf("You've Input a Abnormal Char");
                    printf("Will return LONG_MAX: %ld",LONG_MAX);
                }
                else{
                    abort();
                }
            }
            return LONG_MAX;
        }
        //逐个读取字符
    }
    printf("\n");
    
    Result = ProcessingCalculation(Numbers, NumbersIndex+1,
                                   Operators, OperatorsIndex+1);
    
    return Result;
}

float CalculationModel::ProcessingCalculation(long Numbers[], int NumbersCount,
                                              char Operators[], int OperatorsCount)
{
    try {
        if (NumbersCount != OperatorsCount+1 && NumbersCount > 0 && OperatorsCount >0) {
            //检查
            if (NumbersCount > OperatorsCount+1) {
                printf("Error, throw InputErrorLackOfOperator\n");
                throw InputErrorLackOfOperator;
            }
            else if (NumbersCount < OperatorsCount+1){
                printf("Error, throw InputErrorTooManyOperator\n");
                throw InputErrorTooManyOperator;
            }
            else{
                printf("Error, throw InputErrorUnknown\n");
                throw InputErrorUnknown;
            }
        }
        else if(NumbersCount == 0 && OperatorsCount == 0){
            throw InputErrorNoInput;
        }
        else if (NumbersCount < 0 || OperatorsCount < 0){
            throw InputErrorCountBelowZero;
        }
    } catch (InputError& Error) {
        switch (Error) {
            case InputErrorLackOfOperator:
                printf("Error, throw InputErrorLackOfOperator\n");
                break;
            case InputErrorTooManyOperator:
                printf("Error, throw InputErrorTooManyOperator\n");
                break;
            case InputErrorUnknown:
                printf("Error, throw InputErrorUnknown\n");
                break;
            case InputErrorNoInput:
                printf("Error, throw InputErrorNoInput\n");
                break;
            case InputErrorCountBelowZero:
                printf("Error, throw InputErrorCountBelowZero\n");
                break;
            default:
                printf("Uncaught ERROR");
                break;
        }
    }
    
    float FinalResult = 0;
    float multiplyAndDivisionResult = 0;
    /**
     *  每串连在一起的乘除运算结果
     */
    float tempResult = 0;
    int NumbersIndex = 0;
    int OperatorsIndex = 0;
    
    //优先处理乘除法

    /**
     *  确定乘除序列前的符号是正还是负
     */
    BOOL isAddingBeforeMultiplyOrDivision =  YES;
    for (int i = 0; i < NumbersCount-1; i++) {
        printf("Numbers[NumbersIndex] : %ld",Numbers[NumbersIndex]);
        if (isMultiplyOrDivisionSign(Operators[OperatorsIndex])) {
        //遇到了乘除号在Operators[OperatorsIndex]
            if (tempResult == 0 && OperatorsIndex-1 >= 0 && !(isAddingOperator(Operators[OperatorsIndex-1]))) {
                /**
                 *  乘除号不是第一个Operator且在一系列乘除号之前的是减号
                 */
                isAddingBeforeMultiplyOrDivision = NO;
            }
            else if(tempResult == 0 && OperatorsIndex-1 >= 0 && isAddingOperator(Operators[OperatorsIndex-1])){
                /**
                 *  乘除号不是第一个Operator且乘除前面是加号
                 */
                isAddingBeforeMultiplyOrDivision = YES;
            }
            
            switch (Operators[OperatorsIndex]) {
                case '*':
                    if (tempResult) {
                        tempResult *= Numbers[NumbersIndex+1];
                        Numbers[NumbersIndex+1] = 0;
                    }
                    else{
                        tempResult += Numbers[NumbersIndex] * Numbers[NumbersIndex+1];
                        Numbers[NumbersIndex] = 0;
                        Numbers[NumbersIndex+1] = 0;
                    }
                    break;
                case '/':
                    if (tempResult) {
                        tempResult /= Numbers[NumbersIndex+1];
                        Numbers[NumbersIndex+1] = 0;
                    }
                    else{
                        tempResult += Numbers[NumbersIndex] / Numbers[NumbersIndex+1];
                        Numbers[NumbersIndex] = 0;
                        Numbers[NumbersIndex+1] = 0;
                    }
                    break;
                default:
                    break;
            }
            //处理乘除后将已完成乘除的数字归零，之后所有的计算只处理加减即可
            Numbers[NumbersIndex] = 0;
            Operators[OperatorsIndex] = '+';
        }
        else{
//没有遇到乘除号在Operators[OperatorsIndex]处
//FIXME:连乘的算完后还会再算一次
            if (isAddingBeforeMultiplyOrDivision && tempResult != 0) {
                multiplyAndDivisionResult += tempResult;
            }
            else if(!isAddingBeforeMultiplyOrDivision && tempResult != 0){
                multiplyAndDivisionResult -= tempResult;
            }
            tempResult = 0;
        }
        NumbersIndex++;
        OperatorsIndex++;
    }
    printf("multiplyAndDivisionResult: %f",multiplyAndDivisionResult);

    FinalResult += multiplyAndDivisionResult;

    FinalResult += Numbers[0];
    NumbersIndex = 1;
    OperatorsIndex = 0;
    
    /**
     *  处理加减
     */
    for (int j = 0; j < NumbersCount-1; j++) {
        
        switch (Operators[OperatorsIndex]) {
            case '+':
                printf("Now adding: %ld",Numbers[NumbersIndex]);
                FinalResult += (float)Numbers[NumbersIndex];
                break;
            case '-':
                printf("Now Minusing: %ld",Numbers[NumbersIndex]);
                FinalResult -= (float)Numbers[NumbersIndex];
                break;
            default:
                printf("Operator:%c",Operators[OperatorsIndex]);
                break;
        }
        printf("Numbers[NumbersIndex] AND +1:  %ld,%ld\n\n",Numbers[NumbersIndex],Numbers[NumbersIndex+1]);
        NumbersIndex++;
        OperatorsIndex++;
    }
    
    printf("Result:%f\n",FinalResult);
    return FinalResult;
}

BOOL CalculationModel::isNumber(const char character){
    
    if (character <= '9' && character >= '0') {
        return YES;
    }
    else{
        return NO;
    }
};

BOOL CalculationModel::isOperator(const char character){
    
    if (character == '+' || character == '-' || character == '*' || character == '/') {
        return YES;
    }
    else{
        return NO;
    }
};

BOOL CalculationModel::isMultiplyOrDivisionSign(const char character){
    if (character == '*' || character == '/') {
        return YES;
    }
    else{
        return NO;
    }
}


BOOL CalculationModel::isAddingOperator(const char character){
    if (character == '+' ) {
        return YES;
    }
    else{
        return NO;
    }
}

char CalculationModel::makeSingleToNumber(const char character[], int characterCount){
    
    char Number[100];
    if (characterCount >= 100) {
        printf("Error");
        abort();
    }
    for (int i = 0; i < characterCount ; i++) {
        std::cout<<"ds";
        Number[i] = character[i];
    }
    
    return 0;
}

