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

-(void)test_cellHasFullListOfPossibilitiesWhenCreated {
    NSArray *possibilities = self.cell11.possibilities;
    
    STAssertTrue(BOARD_SIZE == [possibilities count], [NSString stringWithFormat:@"Size of possibilities when cell is created.  Is %i, should be %i", [possibilities count], BOARD_SIZE]);
    
    for (int i = 1; i <= BOARD_SIZE; i++) {
        NSNumber *iObj = [NSNumber numberWithInt:i];
        STAssertTrue([possibilities containsObject:iObj], [NSString stringWithFormat:@"Possibilities should contain %i", i]);
    }
}

-(void)test_cellHasFewerPossibilitiesWhenSomeRemoved {
    [self.cell11 removePossibility:1];
    
    NSArray *possibilities = self.cell11.possibilities;

    STAssertTrue(BOARD_SIZE - 1 == [possibilities count], [NSString stringWithFormat:@"Size of possibilities after one removal.  Is %i, should be %i", [possibilities count], BOARD_SIZE - 1]);
    
    for (int i = 2; i <= BOARD_SIZE; i++) {
        NSNumber *iObj = [NSNumber numberWithInt:i];
        STAssertTrue([possibilities containsObject:iObj], [NSString stringWithFormat:@"Possibilities should contain %i", i]);
    }
    
    STAssertFalse([possibilities containsObject:[NSNumber numberWithInt:1]], @"Possibilities should not contain 1 after it is removed");
}

-(void)test_cellNotSolvedWhenCreated {
    STAssertFalse(self.cell11.isSolved, @"isSolved property");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
}

-(void)test_cellSolvedWhenEightPossibilitiesHaveBeenRemoved {
    [self.cell11 removePossibility:1];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 1");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");

    [self.cell11 removePossibility:2];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 2");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
    
    [self.cell11 removePossibility:3];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 3");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
    
    [self.cell11 removePossibility:4];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 4");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
    
    [self.cell11 removePossibility:5];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 5");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
    
    [self.cell11 removePossibility:6];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 6");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
    
    [self.cell11 removePossibility:7];
    STAssertFalse(self.cell11.isSolved, @"isSolved property after removing 7");
    STAssertTrue(self.cell11.solution == 0, @"Property solution should be 0 before a solution is found");
    
    [self.cell11 removePossibility:8];
    STAssertTrue(self.cell11.isSolved, @"isSolved property with solution");
    STAssertTrue(self.cell11.solution == 9, @"Property solution should be the solution when it is found");
}

@end
