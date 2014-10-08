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

    CalculationModel *aCalculationModel = new CalculationModel();
    float result = 0;
    for (NSString *testExpression in [testExpressions allValues]) {
        
        int expressionLength = (int)[testExpression length];
        
        result = aCalculationModel->CalculateExpression([testExpression UTF8String] ,expressionLength);
        if (result == [[testExpressions allKeysForObject:testExpression][0] floatValue]) {
            XCTAssert(@"OK");
        }
        else{
            XCTFail(@"Not Right");
        }
    }
    






}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
