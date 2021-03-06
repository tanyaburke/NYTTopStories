//
//  NewsCell.swift
//  NYTTopStories
//
//  Created by Tanya Burke on 2/7/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit
import ImageKit

class NewsCell: UICollectionViewCell {
    
    //imageView of article
    //title of article
    //abstract of article
    public lazy var newsImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    public lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Article Title"
        return label
        
    }()
    
    public lazy var abstractHeadline: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "Abstract Headline"
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupNewsImageViewConstraints()
        setUPArticleTitleConstraints()
        setUPAbstractHeadLineConstraints()
    }
    
    private func setupNewsImageViewConstraints(){
        addSubview(newsImageView)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier:0.60),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor)
            
            
        ])
    }
    
    
    private func setUPArticleTitleConstraints(){
        addSubview(articleTitle)
        
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            articleTitle.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            articleTitle.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 8),
            articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
            
        ])
        
        
    }
    
    
    private func setUPAbstractHeadLineConstraints(){
        addSubview(abstractHeadline)
        
        abstractHeadline.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            abstractHeadline.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 8),
            abstractHeadline.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor),
            abstractHeadline.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor)
            
            
        ])
    }
    
    
    public func configureCell(with article: Article ){
        
        articleTitle.text = article.title
        abstractHeadline.text = article.abstract
        newsImageView.getImage(with: article.getArticleImageURL(for: .thumbLarge)) { [weak self](result) in
            switch result{
            case .failure:
                DispatchQueue.main.async {//needed wherever you update the UI
                    self?.newsImageView.image = UIImage(systemName: "exclamationmark-octagon")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.newsImageView.image = image
                }
            }
        }
        
    }
    
}
