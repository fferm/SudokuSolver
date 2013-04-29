//
//  Cell.h
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@class Board;

@interface Cell : NSObject
@property int row;
@property int col;
@property (nonatomic, readonly) NSArray *possibilities;
@property BOOL isSolved;
@property int solution;
@property (nonatomic, readonly) Board *board;

-(id)initForBoard:(Board *) board atRow:(int)row andCol:(int)col;

-(NSSet *)cellsInSameGroup;

-(void)removePossibility:(int)i;
@end
