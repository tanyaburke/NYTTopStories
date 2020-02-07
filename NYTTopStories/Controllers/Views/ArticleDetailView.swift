//
//  ArticleDetailView.swift
//  NYTTopStories
//
//  Created by Tanya Burke on 2/7/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class ArticleDetailView: UIView {
        
    
   public lazy var newsImageView:UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(systemName: "photo")
           iv.backgroundColor = .yellow
           iv.contentMode = .scaleAspectFill
           return iv
       }()
       
    public lazy var abstractHeadline: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Abstract Headline"
        label.textAlignment = .center
        return label
        
    }()
    
    public lazy var byHeadline: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "by line"
        return label
        
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
            setupNewsImageViewConstraints()
            setUPAbstractHeadLineConstraints()
        }
    
    private func setupNewsImageViewConstraints(){
        addSubview(newsImageView)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            newsImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier:0.40)
           
            
            
        ])
    }
    private func setUPAbstractHeadLineConstraints(){
          addSubview(abstractHeadline)
          
          abstractHeadline.translatesAutoresizingMaskIntoConstraints = false
          
          NSLayoutConstraint.activate([
              
            abstractHeadline.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
              abstractHeadline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
              abstractHeadline.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -8)
              
              
          ])
      }
    
    
    }


