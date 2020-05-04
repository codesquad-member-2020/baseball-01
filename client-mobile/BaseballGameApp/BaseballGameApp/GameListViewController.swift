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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        titleLabel.constraints(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 80, left: 80, bottom: 0, right: -80))
        descriptionLabel.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    }
}

