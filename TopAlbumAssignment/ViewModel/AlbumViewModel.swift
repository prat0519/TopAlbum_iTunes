//
//  AlbumViewModel.swift
//  TopAlbumAssignment
//
//  Created by Pandey, Prashant A (CORP) on 3/16/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    let artistName: String
    let releaseDate: String
    let albumName: String
    let copyright: String
    
    let genres: String
    let imageUrl: String
    let albumUrl: String
    
    init(withAlbum album: Album) {
        self.artistName = album.artistName
        self.releaseDate = album.releaseDate
        self.albumName = album.name
        self.copyright = album.copyright
        
        self.genres = album.genres.map { $0.name }.joined(separator: ", ")
        self.imageUrl = album.artworkUrl100
        self.albumUrl = album.url
    }
}
