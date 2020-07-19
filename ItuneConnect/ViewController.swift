//
//  ViewController.swift
//  ItuneConnect
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 knb. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    let searchBar = UISearchBar()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        view.backgroundColor = .white
        return view
    }()
    
    var datas: [Result] = []
    var url: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }

    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getItuneData() {
        
        AF.request(url, method: .get).responseJSON{ [weak self] (response) in
            guard let newSelf = self else { return }
            switch response.result {
            case .success(let value):
                let result = ItuneData(JSON(value))
                if result.results.count == 0 {
                    print("no result found")
                    return
                }
                newSelf.datas = result.results
                newSelf.collectionView.reloadData()
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
    
    func callAPI() {
        DispatchQueue.main.async {
            self.getItuneData()
        }
    }
    
    func handleTap(_ row: Int) {
        let data = datas[row]
        let imageData = getDataImageFromUrl(data.artworkUrl100)
        guard imageData != nil else {
            print("handleTap - no image found")
            return
        }
        
        let trackDetailViewController = TrackDetailViewController()
        trackDetailViewController.trackImage.image = UIImage(data: imageData! as Data)
        trackDetailViewController.trackName.text = data.trackName
        trackDetailViewController.artistName.text = data.artistName
        trackDetailViewController.price.text = "\(String(data.trackPrice)) \(data.currency)"
        trackDetailViewController.country.text = data.country
        trackDetailViewController.primary.text = data.primaryGenreName
        trackDetailViewController.previewUrl = data.previewURL
        
        self.navigationController?.pushViewController(trackDetailViewController, animated: true)
    }
    
    func getDataImageFromUrl(_ url: String) -> NSData? {
        let nsUrl = NSURL(string: url as String)
        let data = NSData(contentsOf: nsUrl! as URL)
        return data
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let data = getDataImageFromUrl(datas[indexPath.row].artworkUrl100)
        guard data != nil else {
            return cell
        }
        cell.trackImage.image = UIImage(data: data! as Data)
        cell.artistName.text = datas[indexPath.row].artistName
        cell.trackName.text = datas[indexPath.row].trackName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.width/2)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleTap(indexPath.row)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        url = String(format: "https://itunes.apple.com/search?term=%@&limit=20", searchText)
        callAPI()
    }
}

