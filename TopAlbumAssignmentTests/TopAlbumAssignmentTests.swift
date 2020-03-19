//
//  TopAlbumAssignmentTests.swift
//  TopAlbumAssignmentTests
//
//  Created by Pandey, Prashant A (CORP) on 3/15/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import XCTest
@testable import TopAlbumAssignment

class TopAlbumAssignmentTests: XCTestCase {
    
    var viewModel: AlbumListViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let albumVM = AlbumViewModel(withAlbum: Album(id: "id",
                                                      name: "name",
                                                      artistName: "artistName",
                                                      releaseDate: "releaseDate",
                                                      genres: [Genre(genreId: "genreId", name: "genre-name"),
                                                      Genre(genreId: "genreId2", name: "genre-name2")],
                                                      copyright: "copyright",
                                                      artworkUrl100: "artworkUrl100",
                                                      url: "url"))
        viewModel = AlbumListViewModel(albumViewModels: [albumVM])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAlbumInitializedSuccessfully() {
        XCTAssertTrue(viewModel.numberOfAlbums > 0)
    }
    
    func testAlbumDataParsedSuccessfully() {
        guard let albumVM = viewModel.viewModel(atIndex: 0) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(albumVM.artistName, "artistName")
        XCTAssertEqual(albumVM.releaseDate, "releaseDate")
        XCTAssertEqual(albumVM.albumName, "name")
        XCTAssertEqual(albumVM.copyright, "copyright")
        
        XCTAssertEqual(albumVM.genres, "genre-name, genre-name2")
        XCTAssertEqual(albumVM.imageUrl, "artworkUrl100")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
