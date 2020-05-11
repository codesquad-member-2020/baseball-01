//
//  PlayViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    let matchBoardView = MatchBoardView()
    let gameFieldView = UIView()
    let SBOCountBoardView = UIView()
    let playerView = UIView()
    let pitchesView = UIView()

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
        
        view.addSubview(matchBoardView)
        matchBoardView.backgroundColor = .green
        matchBoardView.constraints(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, size: .init(width: 0, height: view.frame.height * 0.12))
        
        view.addSubview(gameFieldView)
        gameFieldView.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        gameFieldView.constraints(topAnchor: matchBoardView.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, size: .init(width: 0, height: view.frame.height * 0.35))
        
        view.addSubview(SBOCountBoardView)
        SBOCountBoardView.backgroundColor = .black
        SBOCountBoardView.alpha = 0.7
        SBOCountBoardView.constraints(topAnchor: gameFieldView.topAnchor, leadingAnchor: gameFieldView.leadingAnchor, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 120, height: 100))
        
        view.addSubview(playerView)
        playerView.backgroundColor = .orange
        playerView.constraints(topAnchor: gameFieldView.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, size: .init(width: 0, height: view.frame.height * 0.13))
        
        view.addSubview(pitchesView)
        pitchesView.backgroundColor = .cyan
        pitchesView.constraints(topAnchor: playerView.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: view.bottomAnchor, trailingAnchor: view.trailingAnchor)
    }
}
