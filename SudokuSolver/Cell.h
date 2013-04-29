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
@property (nonatomic, readonly) NSArray *possibilities;

-(id)initAtRow:(int)row andCol:(int)col;

-(void)removePossibility:(int)i;
@end
