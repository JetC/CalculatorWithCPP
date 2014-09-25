//
//  CalculationModel.h
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <iostream>
//@interface CalculationModel : NSObject

class CalculationModel{
    
public:
    int ReturnANumber(){
        
        return 100;
    };
    
    long CalculateExpression(const char Expression[], int CharactersCountInExpression){
      
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
            
            //分析单个字符
            if (isNumber(Expression[i]) && i != CharactersCountInExpression-1) {
                
                SingleNumber[SingleNumberIndex] = Expression[i];
                SingleNumberIndex++;
            }
            else if (isExpression(Expression[i]) && i > 0 && i != CharactersCountInExpression-1){
                
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
            else if (i == CharactersCountInExpression-1 && isNumber(Expression[i])){
                
                SingleNumber[SingleNumberIndex] = Expression[i];
                SingleNumberIndex++;
                
                Numbers[NumbersIndex] = strtol(SingleNumber, NULL, 10);
                printf("Number:%ld\n",Numbers[NumbersIndex]);
            }
            else{
                printf("Error");
                abort();
            }
            
            
            
            
        }
        printf("\n");
        
        
        
        
        return Result;
    };
    
//    long addingTogether(const char Expression[], int CharactersCountInExpression){
//        
//        
//        
//    };
    
    BOOL isNumber(const char character){
      
        if (character <= '9' && character >= '1') {
            return YES;
        }
        else{
            return NO;
        }
    };
    
    BOOL isExpression(const char character){
        
        if (character == '+' || character == '-' || character == '*' || character == '/') {
            return YES;
        }
        else{
            return NO;
        }
    };
    
    char makeSingleToNumber(const char character[], int characterCount){
        
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
    
    
    
    
    
    
};

//@end
