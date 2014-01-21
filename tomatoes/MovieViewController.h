//
//  MovieViewController.h
//  tomatoes
//
//  Created by Jenny Kwan on 1/20/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>
#import "Movie.h"

@interface MovieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bigMoviePic;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *cast;

@property (nonatomic, strong) Movie *movie;

@end
