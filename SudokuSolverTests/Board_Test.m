//
//  Board_Test.m
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import "Board_Test.h"
#import "Board.h"
#import "Cell.h"

@interface Board_Test()
@property (nonatomic, strong) Board* board;
@end

@implementation Board_Test
@synthesize board = _board;

-(void)setUp {
    [super setUp];
    self.board = [[Board alloc] init];
}

-(void)testBoardHasCells {
    for(int row = 1; row <= BOARD_SIZE; row++) {
        for (int col = 1; col <= BOARD_SIZE; col++) {
            Cell *cell = [self.board getCellAtRow:row andAtCol:col];
            STAssertNotNil(cell, [NSString stringWithFormat:@"The board did not have a cell at col %i and row %i", row, col]);
        }
    }
}

-(void)testIllegalBoardCoordinates {
    STAssertThrows(
                   [self.board getCellAtRow:0 andAtCol:1],
                   @"getCellAtRow:0 andAtCol:1 is out of bounds"
                   );
    
    STAssertThrows(
                   [self.board getCellAtRow:BOARD_SIZE + 1 andAtCol:1],
                   @"getCellAtRow:BOARD_SIZE + 1 andAtCol:1 is out of bounds"
                   );

    
    STAssertThrows(
                   [self.board getCellAtRow:1 andAtCol:0],
                   @"getCellAtRow:1 andAtCol:0 is out of bounds"
                   );
    
    STAssertThrows(
                   [self.board getCellAtRow:1 andAtCol:BOARD_SIZE + 1],
                   @"getCellAtRow:1 andAtCol:BOARD_SIZE + 1 is out of bounds"
                   );

}

-(void)testCellCoordinatesSameAsBoardCoordinates {
    for (int row = 1; row <= BOARD_SIZE; row++) {
        for (int col = 1; col <= BOARD_SIZE; col++) {
            Cell *cell = [self.board getCellAtRow:row andAtCol:col];
            STAssertEquals(cell.row, row, @"Cell row should be same as board row");
            STAssertEquals(cell.col, col, @"Cell col should be same as board col");
        }
    }
}

-(void)testGroup {
    for (int row = 1; row <= BOARD_SIZE; row++) {
        for (int col = 1; col <= BOARD_SIZE; col++) {
            Cell *cell = [self.board getCellAtRow:row andAtCol:col];

            NSSet *inSameGroup = [self.board cellsInSameGroupAs:cell];

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


@end
