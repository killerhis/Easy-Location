//
//  NSMutableString+AddText.m
//  Easy Location
//
//  Created by Hicham Chourak on 30/06/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import "NSMutableString+AddText.h"

@implementation NSMutableString (AddText)

- (void)addText:(NSString *)text withSeparator:(NSString *)separator
{
    if (text != nil) {
        if ([self length] > 0) {
            [self appendString:separator];
        }
        [self appendString:text];
    }
}

@end
