//
//  TrackDetailViewController.swift
//  ItuneConnect
//
//  Created by Apple on 7/19/20.
//  Copyright © 2020 knb. All rights reserved.
//

import UIKit
import AVKit

class TrackDetailViewController: UIViewController {
    
    let trackImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    let trackNameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Track name:"
        return label
    }()
    
    let trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let artistNameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Artist name:"
        return label
    }()
    
    let artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let priceTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Price:"
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let countryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Country:"
        return label
    }()
    
    let country: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let primaryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Primary:"
        return label
    }()
    
    let primary: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(play), for: .touchUpInside)
        return button
    }()
    
    var previewUrl: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(trackImage)
        view.addSubview(trackNameTitle)
        view.addSubview(trackName)
        view.addSubview(artistNameTitle)
        view.addSubview(artistName)
        view.addSubview(priceTitle)
        view.addSubview(price)
        view.addSubview(countryTitle)
        view.addSubview(country)
        view.addSubview(primaryTitle)
        view.addSubview(primary)
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            trackImage.topAnchor.constraint(equalTo: view.topAnchor),
            trackImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trackImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trackImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.45)
        ])
        
        NSLayoutConstraint.activate([
            trackNameTitle.topAnchor.constraint(equalTo: trackImage.bottomAnchor, constant: 7),
            trackNameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            trackName.centerYAnchor.constraint(equalTo: trackNameTitle.centerYAnchor),
            trackName.leadingAnchor.constraint(equalTo: trackNameTitle.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            artistNameTitle.topAnchor.constraint(equalTo: trackNameTitle.bottomAnchor, constant: 7),
            artistNameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            artistName.centerYAnchor.constraint(equalTo: artistNameTitle.centerYAnchor),
            artistName.leadingAnchor.constraint(equalTo: artistNameTitle.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            priceTitle.topAnchor.constraint(equalTo: artistNameTitle.bottomAnchor, constant: 7),
            priceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            price.centerYAnchor.constraint(equalTo: priceTitle.centerYAnchor),
            price.leadingAnchor.constraint(equalTo: priceTitle.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            countryTitle.topAnchor.constraint(equalTo: priceTitle.bottomAnchor, constant: 7),
            countryTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            country.centerYAnchor.constraint(equalTo: countryTitle.centerYAnchor),
            country.leadingAnchor.constraint(equalTo: countryTitle.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            primaryTitle.topAnchor.constraint(equalTo: countryTitle.bottomAnchor, constant: 7),
            primaryTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            primary.centerYAnchor.constraint(equalTo: primaryTitle.centerYAnchor),
            primary.leadingAnchor.constraint(equalTo: primaryTitle.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: primaryTitle.bottomAnchor, constant: 50),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func play() {
        let url = NSURL(string: previewUrl)
        let player = AVPlayer(url: url! as URL)
        let avPlayerViewController = AVPlayerViewController()
        avPlayerViewController.player = player
        
        self.present(avPlayerViewController, animated: true) {
            avPlayerViewController.player?.play()
        }
        
//        self.navigationController?.pushViewController(avPlayerViewController, animated: true)
//        avPlayerViewController.player?.play()
    }
}
