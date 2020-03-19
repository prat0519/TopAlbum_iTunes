//
//  Album.swift
//  TopAlbumAssignment
//
//  Created by Pandey, Prashant A (CORP) on 3/16/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import Foundation

struct Album: Codable {
    
    let id: String
    let name: String
    let artistName: String
    let releaseDate: String
    let genres: [Genre]
    let copyright: String
    let artworkUrl100: String
    let url: String
}

struct Genre: Codable {
    let genreId: String
    let name: String
}
