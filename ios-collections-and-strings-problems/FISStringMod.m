//
//  FISStringMod.m
//  ios-collections-and-strings-problems
//
//  Created by Gan Chau on 6/5/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISStringMod.h"

@implementation FISStringMod

- (NSString *)createHorizontalBorderWithString:(NSString *)string
                                  stringLength:(NSUInteger)stringLength
{
    for (NSUInteger i = 0; i < stringLength + 4; i++) {
        string = [string stringByAppendingString:@"*"];
    }
    return [string stringByAppendingString:@"\n"];
}

- (void)frameStringsWithArray:(NSArray *)stringList
{
    NSUInteger longestStringLength = 0;
    NSString *formattedString = @"\n";
    
    for (NSString *string in stringList) {
        if (string.length > longestStringLength) {
            longestStringLength = string.length;
        }
    }
    
    formattedString = [self createHorizontalBorderWithString:formattedString stringLength:longestStringLength];
    
    for (NSString *string in stringList) {
        NSString *lineOfString = @"";
        lineOfString = [lineOfString stringByAppendingString:[NSString stringWithFormat:@"* %@", string]];
        if (string.length < longestStringLength) {
            NSUInteger difference = longestStringLength - string.length;
            for (NSUInteger i = 0; i < difference; i++) {
                lineOfString = [lineOfString stringByAppendingString:@" "];
            }
        }
        lineOfString = [lineOfString stringByAppendingString:@" *\n"];
        formattedString = [formattedString stringByAppendingString:lineOfString];
    }
    
    formattedString = [self createHorizontalBorderWithString:formattedString stringLength:longestStringLength];
    NSLog(@"%@", formattedString);
}

- (NSString *)englishToPigLatin:(NSString *)sentence
{
    NSArray *array = [sentence componentsSeparatedByString:@" "];
    NSMutableString *newSentence = [@"" mutableCopy];
    
    // Hello world from The Flatiron School
    for (NSString *word in array) {
        NSString *firstChar = [word substringToIndex:1];
        NSMutableString *newWord = [[word substringFromIndex:1] mutableCopy];
        
        if ([firstChar isEqualToString:firstChar.uppercaseString]) {
            newWord = [newWord.capitalizedString mutableCopy];
            firstChar = firstChar.lowercaseString;
        }
        
        NSString *ayWord = [firstChar stringByAppendingString:@"ay"];
        [newWord appendString:ayWord];
        
        if ([newSentence isEqualToString:@""]) {
            [newSentence appendString:newWord];
        } else {
            [newSentence appendFormat:@" %@", newWord];
        }
    }
    return newSentence;
}

- (NSString *)pigLatinToEnglish:(NSString *)sentence
{
    NSArray *array = [sentence componentsSeparatedByString:@" "];
    NSMutableString *newSentence = [@"" mutableCopy];
    
    // Ellohay orldway romfay Hetay Latironfay Choolsay
    for (NSString *word in array) {
        NSString *firstChar = [[word substringFromIndex:word.length - 3] substringToIndex:1];
        NSString *newWord = [word substringToIndex:word.length - 3];
        
        if ([newWord isEqualToString:newWord.capitalizedString]) {
            newWord = newWord.lowercaseString;
            firstChar = firstChar.uppercaseString;
        }
        
        newWord = [firstChar stringByAppendingString:newWord];
        
        if ([newSentence isEqualToString:@""]) {
            [newSentence appendString:newWord];
        } else {
            [newSentence appendFormat:@" %@", newWord];
        }
    }
    return newSentence;
}

- (NSMutableArray *)mergeTheArray:(NSArray *)firstArray with:(NSArray *)secondArray
{
    NSMutableArray *mergedArray = [@[] mutableCopy];
    NSUInteger diff = secondArray.count - firstArray.count;
    for (NSUInteger i = 0; i < firstArray.count; i++) {
        [mergedArray addObject:secondArray[i]];
        [mergedArray addObject:firstArray[i]];
    }
    for (NSUInteger i = (secondArray.count - diff); i < secondArray.count; i++) {
        [mergedArray addObject:secondArray[i]];
    }
    return mergedArray;
}

- (NSArray *)combineArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray
{
    NSMutableArray *combinedArray = [@[] mutableCopy];
    if (firstArray.count <= secondArray.count) {
        combinedArray = [self mergeTheArray:firstArray with:secondArray];
    } else {
        combinedArray = [self mergeTheArray:secondArray with:firstArray];
    }
    return [combinedArray copy];
}

- (NSArray *)numberToArray:(NSNumber *)number
{
    NSString *numberAsString = [number stringValue];
    NSMutableArray *arrayOfNumbers = [@[] mutableCopy];
    for (NSUInteger i = 0; i < numberAsString.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSNumber *digit = @([[numberAsString substringWithRange:range] integerValue]);
        [arrayOfNumbers addObject:digit];
    }
    return [arrayOfNumbers copy];
}

- (NSArray *)reverseArray:(NSArray *)array
{
    return [array reverseObjectEnumerator].allObjects;
}

@end
