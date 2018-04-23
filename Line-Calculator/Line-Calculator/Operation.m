//
//  Operation.m
//  Line-Calculator
//
//  Created by Viktoryia Barzdyka on 4/23/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"
#import <math.h>

@implementation Add

- (double) apply:(double) a and:(double) b {
    return a + b;
}

- (NSInteger) getPriority {
    return 1;
}

@end

@implementation Subtract

- (double) apply:(double) a and:(double) b {
    return a - b;
}

- (NSInteger) getPriority {
    return 1;
}

@end

@implementation Multiply

- (double) apply:(double) a and:(double) b {
    return a * b;
}

- (NSInteger) getPriority {
    return 2;
}

@end

@implementation Divide

- (double) apply:(double) a and:(double) b {
    return a / b;
}

- (NSInteger) getPriority {
    return 2;
}

@end

@implementation Pow

- (double) apply:(double) a and:(double) b {
    return pow(a, b);
}

- (NSInteger) getPriority {
    return 3;
}

@end
