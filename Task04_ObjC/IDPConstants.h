//
//  IDPConstants.h
//  Task03_ObjC
//
//  Created by Student003 on 5/8/17.
//  Copyright © 2017 Student003. All rights reserved.
//

#import <Foundation/Foundation.h>

#define constantDeclaration(type, name) extern type const name;

constantDeclaration(NSUInteger, IDPRandomStringLength);
constantDeclaration(NSRange, IDPRandomStringLengthRange);
constantDeclaration(NSRange, IDPLowercaseLetterAlphabet);
constantDeclaration(NSRange, IDPUppercaseLetterAlphabet);
constantDeclaration(NSRange, IDPNumericAlphabet);
