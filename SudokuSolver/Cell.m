//
//  Cell.m
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize possibilities = _possibilities;
@synthesize board = _board;

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

-(id)initForBoard:(Board *)board atRow:(int)row andCol:(int)col {
    self = [self init];

    _board = board;
    self.row = row;
    self.col = col;
    
    return self;
    
}

-(NSSet *)cellsInSameGroup {
    NSMutableSet *mutRet = [NSMutableSet set];
    
    // Add all in same row
    for (int col = 1; col <= BOARD_SIZE; col++) {
        [mutRet addObject:[self.board getCellAtRow:self.row andAtCol:col]];
    }
    // Add all in same col
    for (int row = 1; row <= BOARD_SIZE; row++) {
        [mutRet addObject:[self.board getCellAtRow:row andAtCol:self.col]];
    }
    
    int startingRow = ((self.row - 1) / 3) * 3 + 1; // Integer division, i e round down
    int startingCol = ((self.col - 1) / 3) * 3 + 1; // Integer division, i e round down
    
    for (int row = startingRow; row < startingRow + 3; row++) {
        for (int col = startingCol; col < startingCol + 3; col++) {
            [mutRet addObject:[self.board getCellAtRow:row andAtCol:col]];
        }
    }
    
    return [mutRet copy];
}

-(void)removePossibility:(int)i {
    NSMutableArray *mutRet = [self.possibilities mutableCopy];
    [mutRet removeObject:[NSNumber numberWithInt:i]];
    _possibilities = [mutRet copy];
    
    [self checkForSolution];
}

-(void)checkForSolution {
    if (self.possibilities.count == 1) {
        self.isSolved = YES;
        self.solution = [[self.possibilities objectAtIndex:0] intValue];
    }
}

@end
