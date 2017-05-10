//
//  NSString+IDPRandomString.m
//  Task04_ObjC
//
//  Created by Student003 on 5/8/17.
//  Copyright © 2017 Student003. All rights reserved.
//

#import "NSString+IDPRandomString.h"

#import "IDPRandom.h"
#import "IDPConstants.h"

@implementation NSString (IDPRandomString)

+ (id)alphabetByAppendingAlphabet:(id)alphabet appendedAlphabet:(id)appendedAlphabet {
    if (!appendedAlphabet) {
        return nil;
    }
    
    NSMutableString *result = [NSMutableString stringWithString:alphabet];
    
    return [result stringByAppendingString:appendedAlphabet];
}

+ (id)alphanumericAlphabet {
    return [self alphabetByAppendingAlphabet:[self letterAlphabet] appendedAlphabet:[self numericAlphabet]];
}

+ (id)numericAlphabet {
    return [self alphabetWithUnicodeRange:IDPNumericAlphabet];
}

+ (id)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:IDPLowercaseLetterAlphabet];
}

+ (id)uppercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:IDPUppercaseLetterAlphabet];
}

+ (id)letterAlphabet {
    return [self alphabetByAppendingAlphabet:[self lowercaseLetterAlphabet]
                            appendedAlphabet:[self uppercaseLetterAlphabet]];
}

+ (id)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    
    return result;
}

+ (id)randomString {
    return [self randomStringWithLength:IDPRandomWithRange(IDPRandomStringLengthRange)];
}

+ (id)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength =  alphabet.length;
    for (int i = 0; i < length; i++) {
        unichar character = [alphabet characterAtIndex:IDPRandom(alphabetLength)];
        [result appendFormat:@"%c", character];
    }
    
    return result;
}
@end
 
