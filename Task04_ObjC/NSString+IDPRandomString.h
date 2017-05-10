//
//  NSString+IDPRandomString.h
//  Task04_ObjC
//
//  Created by Student003 on 5/8/17.
//  Copyright © 2017 Student003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IDPRandomString)

+ (id)alphabetByAppendingAlphabet:(id)alphabet appendedAlphabet:(id)appendedAlphabet;

+ (id)alphanumericAlphabet;
+ (id)numericAlphabet;
+ (id)letterAlphabet;
+ (id)lowercaseLetterAlphabet;
+ (id)uppercaseLetterAlphabet;
+ (id)alphabetWithUnicodeRange:(NSRange)range;

+ (id)randomString;
+ (id)randomStringWithLength:(NSUInteger)length;
+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
