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
    
    for (int row = 0; row <= BOARD_SIZE - 1; row++) {
        NSMutableArray *mutRow = [NSMutableArray arrayWithCapacity:BOARD_SIZE];
    
        for (int col = 0; col <= BOARD_SIZE - 1; col++) {
            [mutRow insertObject:[[Cell alloc] init] atIndex:col];
        }
        
        [mutRows insertObject:[mutRow copy] atIndex:row];
    }
    self.rows = [mutRows copy];
}

-(Cell *)getCellAtRow:(int)row andAtCol:(int)col {
    NSArray *cols = [self.rows objectAtIndex:row - 1];
    return [cols objectAtIndex:col - 1];
}

@end
