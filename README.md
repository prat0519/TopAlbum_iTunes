# TopAlbum (100)

Project Name :-   TopAlbum

TopAlbum is written with Swift 5.0 and Built w/ Xcode 11.3.1.


Problem statement
Fetch data from  Apple's RSS feed (https://rss.itunes.apple.com/en-us) and show them in a list view

1.  Code Architecture (MVVM) :

AlbumListViewController is the view controller to show the list of albums. 
Used table view to process and show the data.

Called fetchAlbums api in AlbumService from AlbumListViewController class. After getting response and mapping the data to AlbumViewModel through Model. Pass AlbumViewModel collection in AlbumListViewModel and assign it back to viewmodel instance and did update UI in AlbumListViewController.   

On selection of any cell, push to the AlbumDetailViewController. Asynchronously downloaded the images for smooth scrolling.

2. UI Part: 

   a.) Added launch screen.

   b.) Used table view to show the album list. 

3.  Unit Testing: 
    
     a) Test to see if album data is parsed successfully.
     b) UI test to load album list, tap on tablecell and go to details page and then back to the table view

Some general goals of the project:
- Utilizes only code for UI (no storyboard/nibs).
- No 3rd party libraries/frameworks.
