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

@interface Cell_Test()
@property (nonatomic, strong) Cell *cell11;
@end

@implementation Cell_Test
@synthesize cell11 = _cell11;

-(void)setUp {
    self.cell11 = [[Cell alloc] initAtRow:1 andCol:1];
}

-(void)testCellHasFullListOfPossibilitiesWhenCreated {
    NSArray *possibilities = self.cell11.possibilities;
    
    STAssertTrue(BOARD_SIZE == [possibilities count], [NSString stringWithFormat:@"Size of possibilities when cell is created.  Is %i, should be %i", [possibilities count], BOARD_SIZE]);
    
    for (int i = 1; i <= BOARD_SIZE; i++) {
        NSNumber *iObj = [NSNumber numberWithInt:i];
        STAssertTrue([possibilities containsObject:iObj], [NSString stringWithFormat:@"Possibilities should contain %i", i]);
    }
}

-(void)testCellHasFewerPossibilitiesWhenSomeRemoved {
    [self.cell11 removePossibility:1];
    
    NSArray *possibilities = self.cell11.possibilities;

    STAssertTrue(BOARD_SIZE - 1 == [possibilities count], [NSString stringWithFormat:@"Size of possibilities after one removal.  Is %i, should be %i", [possibilities count], BOARD_SIZE - 1]);
    
    for (int i = 2; i <= BOARD_SIZE; i++) {
        NSNumber *iObj = [NSNumber numberWithInt:i];
        STAssertTrue([possibilities containsObject:iObj], [NSString stringWithFormat:@"Possibilities should contain %i", i]);
    }
    
    STAssertFalse([possibilities containsObject:[NSNumber numberWithInt:1]], @"Possibilities should not contain 1 after it is removed");
}

@end
