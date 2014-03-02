//
//  NSString+Additions.m
//  Lezione1_a
//
//  Created by Andrea Maschio on 02/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

-(NSString*)escapedString{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
