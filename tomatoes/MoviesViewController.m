//
//  MoviesViewController.m
//  tomatoes
//
//  Created by Jenny Kwan on 1/20/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "MovieViewController.h"
#import "MBProgressHUD.h"

@interface MoviesViewController ()

@property (nonatomic, strong) NSMutableArray *movies;
@property (weak, nonatomic) IBOutlet UILabel *networkError;
@property (strong, nonatomic) MBProgressHUD *hud;

- (void)reload;
- (void)refreshMe:(UIRefreshControl *)refresh;

@end

@implementation MoviesViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self reload];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self reload];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.networkError.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Movies";
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh"];
    [refresh addTarget:self action:@selector(refreshMe:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Movie *movie = self.movies[indexPath.row];
    
    MovieViewController *movieViewController = (MovieViewController *)segue.destinationViewController;
    movieViewController.movie = movie;
}

# pragma mark - Table view methods
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    Movie *movie = self.movies[indexPath.row];
    
    cell.movieTitleLabel.text = movie.title;
    cell.synopsisTitleLabel.text = movie.synopsis;
    cell.castLabel.text = movie.cast;
    [cell.moviePic setImageWithURL:[NSURL URLWithString:movie.thumbnail]];
    return cell;
}

#pragma mark - Private methods

- (void) refreshMe: (UIRefreshControl *)refresh;{
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [self reload];
    
    [refresh endRefreshing];
}

- (void) reload {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{

        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (connectionError == nil) {
                NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                NSArray *movie_arr =[object objectForKey:@"movies"];
                self.movies = [NSMutableArray arrayWithCapacity:[movie_arr count]];
                for (id movie in movie_arr) {
                    Movie *movie_obj = [[Movie alloc] initWithDictionary:movie];
                    [self.movies addObject:movie_obj];
                    NSLog(@"%@", movie_obj.cast);
                }
                
                [self.tableView reloadData];
                NSLog(@"%@", object);
                self.networkError.hidden = YES;
            } else {
                NSLog(@"Network Error");
                self.networkError.hidden = NO;
            }
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

@end
