User can view a list of movies from Rotten Tomatoes.  Poster images must be loading asynchronously.  An easy way to do that is to use the UIImageView category in the AFNetworking library.
User can view movie details by tapping on a cell
User sees loading state while waiting for movies API.  You can may use one of the 3rd party libraries here.
User sees error message when there's a networking error.  You may not use UIAlertView to display the error.  See this screenshot for what the error message should look like: network error screenshot.
User can pull to refresh the movie list.
