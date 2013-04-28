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

@end
