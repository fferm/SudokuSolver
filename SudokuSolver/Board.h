//
//  Board.h
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Board : NSObject

#define BOARD_SIZE 9

-(Cell *)getCellAtRow:(int)row andAtCol:(int)col;

-(NSSet *)cellsInSameGroupAs:(Cell *)cell;

@end
