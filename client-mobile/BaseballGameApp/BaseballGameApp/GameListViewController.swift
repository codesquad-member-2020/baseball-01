//
//  GameListViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController {
    
    private let titleLabel = PlainLabel(text: "Game List", color: .white, fontSize: 32, weight: .semibold, alignment: .center)
    private let descriptionLabel = PlainLabel(text: "플레이할 게임을 선택하세요", color: .white, fontSize: 16, weight: .medium, alignment: .center)
    private let collectionView = GameListCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNotification()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .didSelectMatch, object: nil)
    }

    private func configureUI() {
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 2.8, constant: 0).isActive = true
        descriptionLabel.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        collectionView.constraints(topAnchor: descriptionLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, trailingAnchor: view.trailingAnchor, padding: .init(top: 28, left: 32, bottom: -16, right: -32))
    }
}

// MARK:- Notification
extension GameListViewController {
    
    private func configureNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showPopupView), name: .didSelectMatch, object: nil)
    }
    
    @objc func showPopupView(notification: Notification) {
        guard let index = notification.userInfo?["index"] as? Int else { return }
    }
}
