//
//  PlayViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        configureTabBar()
        configureUI()
    }
    
    private func configureTabBar() {
        tabBarItem.title = "play"
        tabBarItem.image = UIImage(named: "tabbar.icon.play")
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    
}
