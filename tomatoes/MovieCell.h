//
//  MovieCell.h
//  tomatoes
//
//  Created by Jenny Kwan on 1/20/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *moviePic;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *synopsisTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *castLabel;

@end
