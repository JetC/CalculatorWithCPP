//
//  CalculationModelTests.m
//  CalculatorWithCPP
//
//  Created by 孙培峰 on 9/26/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#include "CalculationModel.h"

@interface CalculationModelTests : XCTestCase

@end

@implementation CalculationModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    NSString *filePath = [[NSBundle bundleForClass:[self class]]pathForResource:@"TestExpressions" ofType:@"plist"];
    NSDictionary *testExpressions = [NSDictionary dictionaryWithContentsOfFile:filePath];
    [testExpressions count];
    char *TestCases[40];
    for (int i = 0; i<30 ; i++) {
        char SingleCase[30] = "1+2+1-2+11-2223+212+21+32134";
        char cutOver[30];
        strlcpy(&cutOver[30] , &SingleCase[30], sizeof(cutOver[30]));
        printf("TestCases[i]: %s\n",TestCases[i]);
    }

//    CalculationModel *aCalculationModel = new CalculationModel();


//    aCalculationModel->CalculateExpression( , );






}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
