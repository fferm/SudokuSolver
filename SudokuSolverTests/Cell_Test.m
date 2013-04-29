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
@property (nonatomic, strong) Board *board;
@end

@implementation Cell_Test
@synthesize cell11 = _cell11;
@synthesize board = _board;

-(void)setUp {
    self.board = [[Board alloc] init];
    self.cell11 = [[Cell alloc] initForBoard:self.board atRow:1 andCol:1];
}

-(void)test_cellPointsBackToBoard {
    STAssertTrue(self.cell11.board == self.board, @"cell.board should return same board as cell was created with");
}

-(void)test_group {
    for (int row = 1; row <= BOARD_SIZE; row++) {
        for (int col = 1; col <= BOARD_SIZE; col++) {
            Cell *cell = [self.board getCellAtRow:row andAtCol:col];
            
            NSSet *inSameGroup = [cell cellsInSameGroup];
            
            // Check number of cells i same group
            STAssertTrue([inSameGroup count] == 21, @"There should be 21 cells in the same group");
            
            // Check at all cells in same row are part of the group
            for (int otherCol = 1; otherCol <= BOARD_SIZE; otherCol++) {
                Cell *otherCell = [self.board getCellAtRow:row andAtCol:otherCol];
                STAssertTrue([inSameGroup containsObject:otherCell],[NSString stringWithFormat:@"All cells in the same row should be part of the group.  Row: %i, Col: %i, OtherCol: %i", row, col, otherCol] );
            }
            
            // Check that all cells in same col are part of the group
            for (int otherRow = 1; otherRow <= BOARD_SIZE; otherRow++) {
                Cell *otherCell = [self.board getCellAtRow:otherRow andAtCol:col];
                STAssertTrue([inSameGroup containsObject:otherCell],[NSString stringWithFormat:@"All cells in the same col should be part of the group.  Row: %i, Col: %i, OtherRow: %i", row, col, otherRow] );
            }
            
            // Check that all cells in square group are part of the group
            int startingOtherCol = col - ((col - 1) % 3);
            int startingOtherRow = row - ((row - 1) % 3);
            for (int otherRow = startingOtherRow; otherRow < startingOtherRow + 3; otherRow++) {
                for (int otherCol = startingOtherCol; otherCol < startingOtherCol + 3; otherCol++) {
                    Cell *otherCell = [self.board getCellAtRow:otherRow andAtCol:otherCol];
                    STAssertTrue([inSameGroup containsObject:otherCell],[NSString stringWithFormat:@"All cells in the same square should be part of the group.  Row: %i, Col: %i, OtherRow: %i, OtherCol: %i", row, col, otherRow, otherCol] );
                }
            }
        }
    }
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
