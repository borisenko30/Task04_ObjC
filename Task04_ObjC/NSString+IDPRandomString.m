//
//  NSString+IDPRandomString.m
//  Task04_ObjC
//
//  Created by Student003 on 5/8/17.
//  Copyright © 2017 Student003. All rights reserved.
//

#import "NSString+IDPRandomString.h"

#import "IDPRandom.h"
#import "IDPMacros.h"

IDPStaticConstantRange(NSRange, IDPRandomStringLengthRange, 4, 8);

static NSRange IDPMakeRange(unichar lower, unichar upper);

NSRange IDPMakeRange(unichar lower, unichar upper) {
    NSRange range = NSMakeRange(lower, upper - lower + 1);
    
    return range;
}

@implementation NSString (IDPRandomString)

+ (instancetype)alphanumericAlphabet {
    return [self stringWithString:[[self letterAlphabet] alphabetByAppendingAlphabet:[self numericAlphabet]]];
}

+ (instancetype)numericAlphabet {
    return [self stringWithString:[self alphabetWithUnicodeRange:IDPMakeRange('0','9')]];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self stringWithString:[self alphabetWithUnicodeRange:IDPMakeRange('a','z')]];
}

+ (instancetype)uppercaseLetterAlphabet {
    return [self stringWithString:[self alphabetWithUnicodeRange:IDPMakeRange('A','Z')]];
}

+ (instancetype)letterAlphabet {
    return [self stringWithString:[[self lowercaseLetterAlphabet] alphabetByAppendingAlphabet:[self uppercaseLetterAlphabet]]];
}

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)randomString {
    return [self stringWithString:[self randomStringWithLength:IDPRandomWithRange(IDPRandomStringLengthRange)]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self stringWithString:[self randomStringWithLength:length alphabet:[self alphanumericAlphabet]]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength =  alphabet.length;
    for (int i = 0; i < length; i++) {
        unichar character = [alphabet characterAtIndex:IDPRandom(alphabetLength)];
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

- (instancetype)alphabetByAppendingAlphabet:(NSString *)alphabet {
    id result = self;
    if (alphabet) {
        result = [result stringByAppendingString:alphabet];
    }
    
    //result = [[self class] stringWithString:result];
    
    return result;
}

@end
