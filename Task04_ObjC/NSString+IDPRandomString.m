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

- (instancetype)alphabetByAppendingAlphabet:(NSString *)alphabet {
    id result = self;
    if (alphabet) {
        result = [result stringByAppendingString:alphabet];
    }
    
    return [[self class] stringWithString:result];
}

+ (instancetype)alphanumericAlphabet {
    return [self alphabetByAppendingAlphabet:[self letterAlphabet] toAlphabet:[self numericAlphabet]];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeRange:IDPNumericAlphabet];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:IDPLowercaseLetterAlphabet];
}

+ (instancetype)uppercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:IDPUppercaseLetterAlphabet];
}

+ (instancetype)letterAlphabet {
    return [self alphabetByAppendingAlphabet:[self lowercaseLetterAlphabet]
                                  toAlphabet:[self uppercaseLetterAlphabet]];
}

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    
    return result;
}

+ (instancetype)randomString {
    return [self randomStringWithLength:IDPRandomWithRange(IDPRandomStringLengthRange)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength =  alphabet.length;
    for (int i = 0; i < length; i++) {
        unichar character = [alphabet characterAtIndex:IDPRandom(alphabetLength)];
        [result appendFormat:@"%c", character];
    }
    
    return result;
}
@end
 
