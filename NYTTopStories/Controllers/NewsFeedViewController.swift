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
   
    //data for our collectionView
    private var newsArticles = [Article](){
        
        didSet{
            DispatchQueue.main.async {
                self.newsFeedView.collectionview.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = newsFeedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        newsFeedView.collectionview.delegate = self
        newsFeedView.collectionview.dataSource = self
        
        //register collection view cell
        
        newsFeedView.collectionview.register(NewsCell.self, forCellWithReuseIdentifier: "articleCell") //first time initiating cell and assining the reuse identifier
        fetchStories()
    }
    

    private func fetchStories(for section: String = "Technology"){
        NYTTopStoriesAPIClient.fetchTopStories(for: section) { [weak self](result) in
            switch result{
            case .failure(let appError):
                print("error fetching stories\(appError)")
            case .success(let articles):
               // print("found \(articles.count)")
                self?.newsArticles = articles
            }
        }
    }

}

extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArticles.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? NewsCell else{
            fatalError("couldnt downcast")
        }
        let article = newsArticles[indexPath.row]
        cell.configureCell(with: article)
        cell.backgroundColor = .systemGroupedBackground
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
        let itemHeight: CGFloat = maxSize.height * 0.2
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = newsArticles[indexPath.row]
        
        let articleDVC = ArticleDetailController()
            
        articleDVC.article = article
           
            navigationController?.pushViewController(articleDVC, animated: true)
        }
    }

