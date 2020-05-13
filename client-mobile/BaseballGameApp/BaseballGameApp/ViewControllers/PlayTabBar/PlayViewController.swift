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

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        configureMatchBoardView()
        matchBoardView.updatePlayingIndexBar(isAway: false)
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
