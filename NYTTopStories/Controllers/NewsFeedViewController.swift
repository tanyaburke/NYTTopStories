//
//  NewsFeedViewController.swift
//  NYTTopStories
//
//  Created by Tanya Burke on 2/6/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

   private let newsFeedView = NewsFeedView()
   
    override func loadView() {
        view = newsFeedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        newsFeedView.collectionview.delegate = self
        newsFeedView.collectionview.dataSource = self
        
        //register collection view cell
        
        newsFeedView.collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "articleCell")
    }
    

   

}

extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
   
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    
    //return item size
    //item size = 30% of the height of the debvice
    //item width = 100% of the device
    //this is where you make the size for the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //we capture this in a constant
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.3
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
