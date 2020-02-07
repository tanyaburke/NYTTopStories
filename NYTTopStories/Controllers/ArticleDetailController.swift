//
//  ArticleDetailController.swift
//  NYTTopStories
//
//  Created by Tanya Burke on 2/7/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit
import ImageKit

class ArticleDetailController: UIViewController {
    
    private let detailView = ArticleDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateUI()
        
        
        view.backgroundColor = .systemGroupedBackground
        
        //adding uibarbutton item to the right of navigation title
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage (named: "bookmark"), style: .plain, target: self, action:#selector(saveArticleButtonPressed(_:)) )
        navigationItem.rightBarButtonItem?.tintColor = .blue
    }
    
    override func loadView() {
        view = detailView
    }
    var article: Article? = nil
    
    private func upDateUI(){
     //TODO refactor and setup in article detail view
        //detailView.configureView(for article:article)
        guard let article = article else{
            fatalError()
        }
        navigationItem.title = article.title
        detailView.abstractHeadline.text = article.abstract
        detailView.newsImageView.getImage(with: article.getArticleImageURL(for: .superJumbo)) {[weak self] (result) in
            switch result{
            case .failure:
                break
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.newsImageView.image = image
                }
            }
        }
    }
    
    @objc func saveArticleButtonPressed(_ sender : UIBarButtonItem){
        
        print("button pressed")
    }
    
}
