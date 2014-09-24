//
//  CalculationModel.h
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/24/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface CalculationModel : NSObject

class CalculationModel{
    
public:
    int ReturnANumber(){
        
        return 100;
    };
    
    long CalculateExpression(const char Expression[], int CharactersCountInExpression){
      
        long Result = 0;
        for (int i = 0; i < CharactersCountInExpression; i++) {
            
            printf("%c",Expression[i]);
            
        }
        
        
        return Result;
    };
    
    
    
    
};

//@end
