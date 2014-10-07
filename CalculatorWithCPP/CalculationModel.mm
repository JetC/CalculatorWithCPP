//
//  CalculationModel.m
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#include "CalculationModel.h"

long CalculationModel::CalculateExpression(const char Expression[], int CharactersCountInExpression)
{
    long Result = 0;
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

long CalculationModel::ProcessingCalculation(long Numbers[], int NumbersCount,
                                            char Operators[], int OperatorsCount)
{
    if (NumbersCount != OperatorsCount+1) {
        //检查
        printf("Error\n");
        if (NumbersCount > OperatorsCount+1) {
            return InputErrorLackOfOperator;
        }
        else if (NumbersCount < OperatorsCount+1){
            return InputErrorTooManyOperator;
        }
        else{
            return InputErrorUnknown;
        }
    }

    long FinalResult = 0;
    long tempResult = 0;
    int NumbersIndex = 0;
    int OperatorsIndex = 0;

    for (int i = 0; i < NumbersCount-1; i++) {
        if (isMultiplyOrDivisionSign(Operators[OperatorsIndex])) {
            
            switch (Operators[OperatorsIndex]) {
                case '*':
                    tempResult += Numbers[NumbersIndex] * Numbers[NumbersIndex+1];
                    break;
                    
                case '/':
                    tempResult += Numbers[NumbersIndex] / Numbers[NumbersIndex+1];
                    break;
                default:
                    break;
            }
            Numbers[NumbersIndex] = 0;
            Numbers[NumbersIndex+1] = 0;
            Operators[OperatorsIndex] = '+';
        }
        NumbersIndex++;
        OperatorsIndex++;
        printf("tempResult: %ld",tempResult);
    }
    FinalResult += tempResult;
    NumbersIndex = 0;
    OperatorsIndex = 0;
    
    for (int j = 0; j < NumbersCount-1; j++) {

        switch (Operators[OperatorsIndex]) {
            case '+':
                FinalResult += Numbers[NumbersIndex];
                break;
            case '-':
                FinalResult -= Numbers[NumbersIndex];
                break;
            default:
                break;
        }
        NumbersIndex++;
        OperatorsIndex++;
    }

    printf("Result:%ld\n",FinalResult);
    return FinalResult;
}

BOOL CalculationModel::isNumber(const char character){

    if (character <= '9' && character >= '1') {
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

