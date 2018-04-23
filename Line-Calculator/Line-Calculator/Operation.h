//
//  Operation.h
//  Line-Calculator
//
//  Created by Viktoryia Barzdyka on 4/23/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

@protocol Operation

- (double) apply:(double) a and:(double) b;
- (NSInteger) getPriority;

@end

@interface Add : NSObject <Operation>

@end

@interface Subtract : NSObject <Operation>

@end


@interface Multiply : NSObject <Operation>

@end


@interface Divide : NSObject <Operation>

@end

@interface Pow : NSObject <Operation>

@end

