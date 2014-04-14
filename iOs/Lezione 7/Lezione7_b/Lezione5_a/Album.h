//
//  Album.h
//  Lezione7_b
//
//  Created by Andrea Maschio on 14/04/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * band;
@property (nonatomic) int16_t rating;

@end
