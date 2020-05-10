//
//  MatchViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchViewController: UITabBarController {

    let playViewController = PlayViewController()
    let scoreViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
        configureModalPresentingStyle()
    }
    
    private func configureViewControllers() {
        viewControllers = [playViewController, scoreViewController]
    }
    
    private func configureModalPresentingStyle() {
        self.modalPresentationStyle = .fullScreen
    }
}
