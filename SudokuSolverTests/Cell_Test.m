//
//  Cell_Test.m
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-29.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import "Cell_Test.h"
#import "Cell.h"
#import "Board.h"

@implementation Cell_Test

-(void)testCellHasFullListOfPossibilitiesWhenCreated {
    Cell *cell = [[Cell alloc] initAtRow:1 andCol:1];
    
    NSArray *possibilities = cell.possibilities;
    
    NSLog(@"!!!! size: %i", [possibilities count]);
    
    STAssertTrue(BOARD_SIZE == [possibilities count], [NSString stringWithFormat:@"Size of possibilities when cell is created.  Is %i, should be %i", [possibilities count], BOARD_SIZE]);
    
    for (int i = 1; i <= BOARD_SIZE; i++) {
        NSNumber *iObj = [[NSNumber alloc] initWithInt:i];
        STAssertTrue([possibilities containsObject:iObj], [NSString stringWithFormat:@"Possibilities should contain %i", i]);
    }
}

@end
