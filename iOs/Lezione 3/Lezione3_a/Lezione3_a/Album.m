//
//  Album.m
//  Lezione3_a
//
//  Created by Andrea Maschio on 16/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "Album.h"

@implementation Album

// Implementation
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_band forKey:@"band"];
    [encoder encodeInteger:_rating forKey:@"rating"];
}

- (id)initWithCoder:(NSCoder *)decoder {

        self.title = [decoder decodeObjectForKey:@"title"];
        self.band = [decoder decodeObjectForKey:@"band"];
        self.rating  =[decoder decodeIntegerForKey:@"rating"];
  
    return self;
}

@end
