//
//  Cell.m
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id)initAtRow:(int)row andCol:(int)col {
    self = [self init];
    
    self.row = row;
    self.col = col;
    
    return self;
}

@end
