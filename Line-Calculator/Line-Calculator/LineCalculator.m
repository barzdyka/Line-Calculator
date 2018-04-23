//
//  LineCalculator.m
//  Line-Calculator
//
//  Created by Viktoryia Barzdyka on 4/22/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineCalculator.h"

@implementation LineCalculator

+ (LineCalculator*) defaultValue: (NSNumber*) value {
    LineCalculator *calculator = [LineCalculator alloc];
    calculator = [[calculator initWithNumber:value] autorelease];
    return calculator;
}

- (id) initWithNumber: (NSNumber*) value {
    self = [super init];
    if (self) {
        _operandStack = [[NSMutableArray alloc] initWithObjects:value, nil];
        _operationdStack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (LineCalculator*) add:(NSNumber*) value {
    Add *op = [[[Add alloc] init] autorelease];
    [_operationdStack addObject:op];
    [_operandStack addObject:value];
    return self;
}

- (LineCalculator*) subtract:(NSNumber*) value {
    Subtract *op = [[[Subtract alloc] init] autorelease];
    [_operationdStack addObject:op];
    [_operandStack addObject:value];
    return self;
}

- (LineCalculator*) multiply:(NSNumber*) value {
    Multiply *op = [[[Multiply alloc] init] autorelease];
    [_operationdStack addObject:op];
    [_operandStack addObject:value];
    return self;
}

- (LineCalculator*) divide:(NSNumber*) value{
    Divide *op = [[[Divide alloc] init] autorelease];
    [_operationdStack addObject:op];
    [_operandStack addObject:value];
    return self;
}

- (LineCalculator*) pow:(NSNumber*) value {
    Pow *op = [[[Pow alloc] init] autorelease];
    [_operationdStack addObject:op];
    [_operandStack addObject:value];
    return self;
}

- (double) evaluateInner:(NSMutableArray*) arrayOperation with: (NSMutableArray*) arrayOperand {
    
    //means just created calculator without any operation applied
    if (arrayOperand.count == 1) {
        return [arrayOperand[0] doubleValue];
    }
    
    //means single operation applied
    if (arrayOperation.count == 1) {
        return [arrayOperation[0] apply: [arrayOperand[0] doubleValue] and:[arrayOperand[1] doubleValue]];
    }
    
    double lastOperand = [[arrayOperand lastObject] doubleValue]; //get and remove last operand
    [arrayOperand removeLastObject];
    
    id lastOperation = [arrayOperation lastObject];
    [arrayOperation removeLastObject]; //get and remove last operation
    
    if ([lastOperation getPriority] > [[arrayOperation lastObject] getPriority]) {
        double lastButOneOperand = [[arrayOperand lastObject] doubleValue];
        [arrayOperand removeLastObject];
        double lastOperationEvaluationResult = [lastOperation apply:lastButOneOperand and:lastOperand];
        [arrayOperand addObject: [NSNumber numberWithDouble: lastOperationEvaluationResult]];
        return [self evaluateInner:arrayOperation with:arrayOperand];
    } else {
        return [lastOperation apply:[self evaluateInner:arrayOperation with:arrayOperand] and:lastOperand];
    }
}

- (double) evaluate {
    NSMutableArray *arrayOperationCopy = [[_operationdStack mutableCopy] autorelease];
    NSMutableArray *arrayOperandCopy = [[_operandStack mutableCopy] autorelease];
    return [self evaluateInner:arrayOperationCopy with:arrayOperandCopy];
}

- (NSString*) description {
    return [NSString stringWithFormat:@"%d",  (int) [self evaluate]];
} 

- (void) dealloc {
    [_operandStack release];
    [_operationdStack release];
    [super dealloc];
}

@end

