//
//  TopStoriesTabController.swift
//  NYTTopStories
//
//  Created by Tanya Burke on 2/6/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class TopStoriesTabController: UITabBarController {

    
    private lazy var newsFeedVC: NewsFeedViewController = {
                   let vc = NewsFeedViewController()
                   vc.tabBarItem = UITabBarItem(title: "NewsFeed", image: UIImage(systemName: "eyeglasses"), tag: 0)
                   return vc
               }()
   
    private lazy var savedArticleVC: SavedArticleViewController = {
        let vc = SavedArticleViewController()
        vc.tabBarItem = UITabBarItem(title: "SavedArticles", image: UIImage(systemName: "folder"), tag: 1)
        return vc
    }()
    
    private lazy var settingsVC: SettingsViewController = {
                   let vc = SettingsViewController()
                   vc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
                   return vc
               }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [UINavigationController(rootViewController: newsFeedVC), UINavigationController(rootViewController: savedArticleVC), UINavigationController(rootViewController:settingsVC)]
    }
    

    

}
