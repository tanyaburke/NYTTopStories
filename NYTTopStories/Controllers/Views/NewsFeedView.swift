//
//  NewsFeedView.swift
//  NYTTopStories
//
//  Created by Tanya Burke on 2/6/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class NewsFeedView: UIView {
        
    public lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.autocapitalizationType = .none
        sb.placeholder = "search for article"
        
        return sb
    }()
    
    
    public lazy var collectionview: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .blue
        return cv
    }()
    
    
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit(){
            setupSearchBarConstraints()
            setupCollectionViewConstraints()
        }
    
    private func setupCollectionViewConstraints(){
        
        addSubview(collectionview)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                collectionview.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
                collectionview.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionview.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
    }
    private func setupSearchBarConstraints(){
      
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        
        
        ])
        
    }
    
    
    
    }


