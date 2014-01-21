//
//  MovieViewController.m
//  tomatoes
//
//  Created by Jenny Kwan on 1/20/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()
@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Movie";
    self.summary.text = self.movie.synopsis;
    self.cast.text = self.movie.cast;
    [self.bigMoviePic setImageWithURL:[NSURL URLWithString:self.movie.picture]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
