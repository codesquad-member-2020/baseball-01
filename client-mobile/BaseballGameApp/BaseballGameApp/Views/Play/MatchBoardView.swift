//
//  MatchBoardView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchBoardView: UIView {

    static let cornerRadius: CGFloat = 8.0
    
    private var awayLogoImageView: UIImageView!
    private var awayTeamLabel: UILabel!
    private var awayPlayingBar: UIView!
    private var homeLogoImageView: UIImageView!
    private var homeTeamLabel: UILabel!
    private var homePlayingBar: UIView!
    private var scoreLabel: UILabel!
    private var inningLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        configureMatchBoardView()
    }
    
    func configureUIProperties(awayLogoImageView: UIImageView,
                               awayTeamLabel: UILabel,
                               awayPlayingBar: UIView,
                               homeLogoImageView: UIImageView,
                               homeTeamLabel: UILabel,
                               homePlayingBar: UIView,
                               scoreLabel: UILabel,
                               inningLabel: UILabel) {
        self.awayLogoImageView = awayLogoImageView
        self.awayTeamLabel = awayTeamLabel
        self.awayPlayingBar = awayPlayingBar
        self.homeLogoImageView = homeLogoImageView
        self.homeTeamLabel = homeTeamLabel
        self.homePlayingBar = homePlayingBar
        self.scoreLabel = scoreLabel
        self.inningLabel = inningLabel
        configureUIPropertiesLayer()
    }
    
    private func configureMatchBoardView() {
        layer.cornerRadius = Self.cornerRadius
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
    }
    
    private func configureUIPropertiesLayer() {
        inningLabel.clipsToBounds = true
        inningLabel.layer.cornerRadius = 4
        inningLabel.layer.borderColor = UIColor.black.cgColor
        inningLabel.layer.borderWidth = 1
    }
}
