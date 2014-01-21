//
//  Movie.h
//  tomatoes
//
//  Created by Jenny Kwan on 1/20/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *picture;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)generateCast:(NSDictionary *)dictionary;

@end
