//
//  IDPConstants.m
//  Task03_ObjC
//
//  Created by Student003 on 5/8/17.
//  Copyright © 2017 Student003. All rights reserved.
//

#import "IDPConstants.h"

#define constantInit(type, name, value) type const name = value;
#define constantInitWithRange(type, name, value1, value2) type const name = {value1, value2};

constantInit(NSUInteger, IDPRandomStringLength, 10);
constantInitWithRange(NSRange, IDPRandomStringLengthRange, 4, 8);
constantInitWithRange(NSRange, IDPLowercaseLetterAlphabet, 'a', 26);
constantInitWithRange(NSRange, IDPUppercaseLetterAlphabet, 'A', 26);
constantInitWithRange(NSRange, IDPNumericAlphabet, '0', 10);
