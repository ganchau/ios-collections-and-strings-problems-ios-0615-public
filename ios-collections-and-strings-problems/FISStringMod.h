//
//  FISStringMod.h
//  ios-collections-and-strings-problems
//
//  Created by Gan Chau on 6/5/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISStringMod : NSObject

- (void)frameStringsWithArray:(NSArray *)stringList;
- (NSString *)englishToPigLatin:(NSString *)sentence;
- (NSString *)pigLatinToEnglish:(NSString *)sentence;
- (NSArray *)combineArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray;
- (NSArray *)numberToArray:(NSNumber *)number;
- (NSArray *)reverseArray:(NSArray *)array;

@end
