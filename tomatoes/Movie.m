//
//  Movie.m
//  tomatoes
//
//  Created by Jenny Kwan on 1/20/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.synopsis = dictionary[@"synopsis"];
        self.cast = [self generateCast:dictionary[@"abridged_cast"]];
        self.thumbnail = [dictionary[@"posters"] objectForKey:@"profile"];
        self.picture = [dictionary[@"posters"] objectForKey:@"original"];
    }
    
    return self;
}

- (NSString *)generateCast:(NSDictionary *)dictionary {
    NSMutableArray *cast_arr = [NSMutableArray arrayWithCapacity:[dictionary count]];
    
    for (id cast in dictionary) {
        [cast_arr addObject:cast[@"name"]];
    }
    
    return [cast_arr componentsJoinedByString:@", "];
}

@end
