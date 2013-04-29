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

-(void)test_boardHasCells {
    for(int row = 1; row <= BOARD_SIZE; row++) {
        for (int col = 1; col <= BOARD_SIZE; col++) {
            Cell *cell = [self.board getCellAtRow:row andAtCol:col];
            STAssertNotNil(cell, [NSString stringWithFormat:@"The board did not have a cell at col %i and row %i", row, col]);
        }
    }
}

-(void)test_illegalBoardCoordinates {
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

-(void)test_cellCoordinatesSameAsBoardCoordinates {
    for (int row = 1; row <= BOARD_SIZE; row++) {
        for (int col = 1; col <= BOARD_SIZE; col++) {
            Cell *cell = [self.board getCellAtRow:row andAtCol:col];
            STAssertEquals(cell.row, row, @"Cell row should be same as board row");
            STAssertEquals(cell.col, col, @"Cell col should be same as board col");
        }
    }
}



@end
