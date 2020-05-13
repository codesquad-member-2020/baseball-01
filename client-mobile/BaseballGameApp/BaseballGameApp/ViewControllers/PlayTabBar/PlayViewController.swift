//
//  PlayViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var matchBoardView: MatchBoardView!
    @IBOutlet weak var awayLogoImageView: UIImageView!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var awayPlayingBar: UIView!
    @IBOutlet weak var homeLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homePlayingBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var inningLabel: UILabel!
    
    private var countBoardView: CountBoardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        configureMatchBoardView()
        configureCountBoardView()
    }
    
    private func configureCountBoardView() {
        countBoardView = CountBoardView()
        view.addSubview(countBoardView)
        countBoardView.constraints(topAnchor: matchBoardView.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: 8, left: 12, bottom: 0, right: 0), size: .init(width: matchBoardView.frame.width * 0.25, height: 0))
        countBoardView.heightAnchor.constraint(equalTo: countBoardView.widthAnchor, multiplier: 0.8).isActive = true
        view.layoutIfNeeded()
        countBoardView.configureCountCircleViews()
    }
    
    private func configureMatchBoardView() {
        matchBoardView.configureUIProperties(awayLogoImageView: awayLogoImageView,
                                             awayTeamLabel: awayTeamLabel,
                                             awayPlayingBar: awayPlayingBar,
                                             homeLogoImageView: homeLogoImageView,
                                             homeTeamLabel: homeTeamLabel,
                                             homePlayingBar: homePlayingBar,
                                             scoreLabel: scoreLabel,
                                             inningLabel: inningLabel)
    }
}
