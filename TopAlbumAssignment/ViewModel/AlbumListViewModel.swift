//
//  AlbumListViewModel.swift
//  TopAlbumAssignment
//
//  Created by Pandey, Prashant A (CORP) on 3/16/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import Foundation

class AlbumListViewModel {
    
    private var albumViewModels: [AlbumViewModel]
    
    init(albumViewModels: [AlbumViewModel]) {
        self.albumViewModels = albumViewModels
    }
    
    // MARK:- Public variables & functions
    
    public var numberOfAlbums: Int {
        return albumViewModels.count
    }
    
    public func viewModel(atIndex index: Int) -> AlbumViewModel? {
        guard albumViewModels.indices.contains(index) else {
            print("Invalid index given for album view model.")
            return nil
        }
        return albumViewModels[index]
    }
}
