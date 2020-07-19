//
//  CollectionViewCell.swift
//  ItuneConnect
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 knb. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let trackImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    let textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "David"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Harry Potter and the Death"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(containerView)
        containerView.addSubview(trackImage)
        containerView.addSubview(textView)
        
        textView.addSubview(artistName)
        textView.addSubview(trackName)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            trackImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            trackImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            trackImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            trackImage.heightAnchor.constraint(equalToConstant: self.bounds.height * 2/3)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: trackImage.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            artistName.topAnchor.constraint(equalTo: textView.topAnchor, constant: 6),
            artistName.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            trackName.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 6),
            trackName.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 3)
        ])
    }
}
