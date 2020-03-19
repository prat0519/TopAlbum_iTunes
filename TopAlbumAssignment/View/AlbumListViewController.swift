//
//  AlbumListViewController.swift
//  TopAlbumAssignment
//
//  Created by Pandey, Prashant A (CORP) on 3/15/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import UIKit

class AlbumListViewController: UITableViewController {
    
    var viewModel: AlbumListViewModel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let cellReuseIdentifier = "albumCell"
    
    private var imageCache: [String: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations        
        setupView()
        fetchAlbums()
    }
    
    @objc private func handleRefresh() {
        fetchAlbums()
    }
    
    private func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = 100.0
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl?.beginRefreshing()
        
        title = "Top Album"
    }
    
    
    private func fetchAlbums() {
        AlbumService().fetchAlbums { [weak self] (albums) in
            DispatchQueue.main.async {
                let albumVMs = albums.map { AlbumViewModel(withAlbum: $0) }
                self?.viewModel = AlbumListViewModel(albumViewModels: albumVMs)
                self?.refreshControl?.endRefreshing()
            }
        }
    }
    
    // MARK:- UITableViewDataSource functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfAlbums ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellReuseIdentifier)

        guard let albumVM = viewModel?.viewModel(atIndex: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(albumVM.albumName)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        cell.detailTextLabel?.text = "\(albumVM.artistName)"
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)

        
        if imageCache[albumVM.imageUrl] != nil , let image = imageCache[albumVM.imageUrl] {
            cell.imageView?.image = image
            cell.setNeedsLayout()
        } else {
            AlbumService().fetchAlbumImage(url: albumVM.imageUrl) { [weak self, weak cell] (data) in
                if let image = UIImage(data: data) {
                    self?.imageCache[albumVM.imageUrl] = image
                    DispatchQueue.main.async {
                        cell?.imageView?.image = image
                        cell?.setNeedsLayout()
                    }
                }
            }
        }
        
        return cell
    }
    
    // MARK:- UITableViewDelegate functions
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let albumVM = viewModel?.viewModel(atIndex: indexPath.row) else {
            return
        }
        
        let detailViewController = AlbumDetailViewController()
        detailViewController.viewModel = albumVM
        detailViewController.image = imageCache[albumVM.imageUrl]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
