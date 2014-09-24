//
//  CalculationModel.h
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
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
        for (int i = 0; i < CharactersCountInExpression; i++) {
            
            printf("%d",isNumber(Expression[i]));
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
    
    
    
    
    
    
};

//@end
