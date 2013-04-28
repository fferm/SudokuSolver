//
//  Cell.h
//  SudokuSolver
//
//  Created by Fredrik Ferm on 2013-04-28.
//  Copyright (c) 2013 Fermitet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property int row;
@property int col;

-(id)initAtRow:(int)row andCol:(int)col;
@end
