//
//  NSData+AES.h
//  Safebox
//
//  Created by Juan Ignacio Laube on 16/03/13.
//  Copyright (c) 2013 Juan Ignacio Laube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;


@end