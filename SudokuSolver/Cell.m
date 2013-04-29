//
//  Cell.m
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import "Cell.h"
#import "Board.h"

@implementation Cell
@synthesize possibilities = _possibilities;

-(NSArray *)possibilities {
    if (!_possibilities) {
        NSMutableArray *mutRet = [NSMutableArray array];
        for (int i = 1; i <= BOARD_SIZE; i++) {
            NSNumber *oInt = [[NSNumber alloc] initWithInt:i];
            [mutRet addObject:oInt];
        }
        _possibilities = [mutRet copy];
    }
    return _possibilities;
}

-(id)initAtRow:(int)row andCol:(int)col {
    self = [self init];
    
    self.row = row;
    self.col = col;
    
    return self;
}

-(void)removePossibility:(int)i {
    NSMutableArray *mutRet = [self.possibilities mutableCopy];
    [mutRet removeObject:[NSNumber numberWithInt:i]];
    _possibilities = [mutRet copy];
}

@end
