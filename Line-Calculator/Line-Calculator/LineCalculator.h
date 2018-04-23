//
//  LineCalculator.h
//  Line-Calculator
//
//  Created by Viktoryia Barzdyka on 4/22/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import "Operation.h"

@interface LineCalculator: NSObject

@property (nonatomic, retain) NSMutableArray *operandStack;
@property (nonatomic, retain) NSMutableArray *operationdStack;
+ (LineCalculator*) defaultValue: (NSNumber*) value;
- (id) initWithNumber: (NSNumber*) value;
- (LineCalculator*) add:(NSNumber*) value;
- (LineCalculator*) subtract:(NSNumber*) value;
- (LineCalculator*) multiply:(NSNumber*) value;
- (LineCalculator*) divide:(NSNumber*) value;
- (LineCalculator*) pow:(NSNumber*) value;

@end
