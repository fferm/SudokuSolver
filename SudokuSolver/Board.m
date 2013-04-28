//
//  Board.m
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import "Board.h"

@interface Board()
@property (nonatomic, strong) NSArray *rows;
@end


@implementation Board
@synthesize rows = _rows;

-(id)init {
    self = [super init];
    
    [self initializeCells];

    return self;
}

-(void) initializeCells {
    NSMutableArray *mutRows = [NSMutableArray arrayWithCapacity:BOARD_SIZE];
    
    for (int row = 1; row <= BOARD_SIZE; row++) {
        NSMutableArray *mutRow = [NSMutableArray arrayWithCapacity:BOARD_SIZE];
    
        for (int col = 1; col <= BOARD_SIZE; col++) {
            [mutRow insertObject:[[Cell alloc] initAtRow:row andCol:col] atIndex:col - 1];
        }
        
        [mutRows insertObject:[mutRow copy] atIndex:row - 1];
    }
    self.rows = [mutRows copy];
}

-(Cell *)getCellAtRow:(int)row andAtCol:(int)col {
    NSArray *cols = [self.rows objectAtIndex:row - 1];
    return [cols objectAtIndex:col - 1];
}

-(NSSet *)cellsInSameGroupAs:(Cell *)cell {
    NSMutableSet *mutRet = [NSMutableSet set];

    // Add all in same row
    for (int col = 1; col <= BOARD_SIZE; col++) {
        [mutRet addObject:[self getCellAtRow:cell.row andAtCol:col]];
    }
    // Add all in same col
    for (int row = 1; row <= BOARD_SIZE; row++) {
        [mutRet addObject:[self getCellAtRow:row andAtCol:cell.col]];
    }
    
    int startingRow = ((cell.row - 1) / 3) * 3 + 1; // Integer division, i e round down
    int startingCol = ((cell.col - 1) / 3) * 3 + 1; // Integer division, i e round down

    for (int row = startingRow; row < startingRow + 3; row++) {
        for (int col = startingCol; col < startingCol + 3; col++) {
            [mutRet addObject:[self getCellAtRow:row andAtCol:col]];
        }
    }

    return [mutRet copy];
}

@end
