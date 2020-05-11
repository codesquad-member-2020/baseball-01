//
//  MatchBoardView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchBoardView: UIView {

    private let awayLogoImageView = LogoImageView()
    private let awayNameLabel = PlainLabel(text: "AWAY", color: .black, fontSize: 18, weight: .medium, alignment: .left)
    private let awayScoreLabel = PlainLabel(text: "0", color: .red, fontSize: 32, weight: .bold, alignment: .right)
    private var awayTeamInfoStackView: UIStackView!
    private let versusLabel = PlainLabel(text: "VS", color: .black, fontSize: 16, weight: .medium, alignment: .center)
    private let homeLogoImageView = LogoImageView()
    private let homeNameLabel = PlainLabel(text: "HOME", color: .black, fontSize: 18, weight: .medium, alignment: .right)
    private let homeScoreLabel = PlainLabel(text: "0", color: .red, fontSize: 32, weight: .bold, alignment: .left)
    private var homeTeamInfoStackView: UIStackView!
    private let inningLabel = PlainLabel(text: "1회 초", color: .yellow, fontSize: 13, weight: .medium, alignment: .center)
    
    private let currentPlayerView = UIView()
    private var currentPlayerViewAwayLeading: NSLayoutConstraint?
    private var currentPlayerViewAwayTrailing: NSLayoutConstraint?
    private var currentPlayerViewHomeLeading: NSLayoutConstraint?
    private var currentPlayerViewHomeTrailing: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        configureUI()
    }
    
    func changeCurrentPlayerView(isAway: Bool = true) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            if isAway {
                self.currentPlayerViewAwayLeading?.isActive = true
                self.currentPlayerViewAwayTrailing?.isActive = true
                self.currentPlayerViewHomeLeading?.isActive = false
                self.currentPlayerViewHomeTrailing?.isActive = false
            } else {
                self.currentPlayerViewAwayLeading?.isActive = false
                self.currentPlayerViewAwayTrailing?.isActive = false
                self.currentPlayerViewHomeLeading?.isActive = true
                self.currentPlayerViewHomeTrailing?.isActive = true
            }
            self.layoutIfNeeded()
        })
    }
}

// MARK:- Layout
extension MatchBoardView {
    private func configureUI() {
        configureStackViews()
        
        addSubview(versusLabel)
        addSubview(awayTeamInfoStackView)
        addSubview(awayScoreLabel)
        addSubview(homeTeamInfoStackView)
        addSubview(homeScoreLabel)
        addSubview(currentPlayerView)
        addSubview(inningLabel)
        
        versusLabel.centerInSuperView()
        versusLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        configureAwayTeamInfoLayout()
        configureHomeTeamInfoLayout()
        configureInningViewLayout()
        configureCurrentPlayerViewLayout()
    }
    
    private func configureStackViews() {
        awayTeamInfoStackView = UIStackView(arrangedSubviews: [
            awayLogoImageView,
            awayNameLabel
        ])
        homeTeamInfoStackView = UIStackView(arrangedSubviews: [
            homeNameLabel,
            homeLogoImageView
        ])
    }
    
    private func configureInningViewLayout() {
        inningLabel.backgroundColor = .black
        inningLabel.alpha = 0.8
        inningLabel.layer.cornerRadius = 8
        inningLabel.clipsToBounds = true
        inningLabel.constraints(topAnchor: versusLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 72, height: 20))
        inningLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func configureCurrentPlayerViewLayout() {
        currentPlayerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        currentPlayerView.alpha = 0.7
        currentPlayerView.layer.cornerRadius = 4
        
        currentPlayerView.constraints(topAnchor: awayTeamInfoStackView.bottomAnchor, leadingAnchor: nil, bottomAnchor: nil, trailingAnchor: nil, size: .init(width: 0, height: 8))
        currentPlayerViewAwayLeading = currentPlayerView.leadingAnchor.constraint(equalTo: awayTeamInfoStackView.leadingAnchor)
        currentPlayerViewAwayTrailing = currentPlayerView.trailingAnchor.constraint(equalTo: inningLabel.leadingAnchor, constant: -16)
        currentPlayerViewHomeLeading = currentPlayerView.leadingAnchor.constraint(equalTo: inningLabel.trailingAnchor, constant: 16)
        currentPlayerViewHomeTrailing = currentPlayerView.trailingAnchor.constraint(equalTo: homeTeamInfoStackView.trailingAnchor)
        currentPlayerViewAwayLeading?.isActive = true
        currentPlayerViewAwayTrailing?.isActive = true
        currentPlayerViewHomeLeading?.isActive = false
        currentPlayerViewHomeTrailing?.isActive = false
    }
    
    private func configureAwayTeamInfoLayout() {
        awayLogoImageView.image = #imageLiteral(resourceName: "logo.doosan")
        awayLogoImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        awayNameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        awayTeamInfoStackView.alignment = .center
        awayTeamInfoStackView.distribution = .fillProportionally
        awayTeamInfoStackView.spacing = 12
        awayTeamInfoStackView.constraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, bottomAnchor: bottomAnchor, trailingAnchor: awayScoreLabel.leadingAnchor, padding: .init(top: 16, left: 12, bottom: -20, right: -8))
        
        awayScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        let awayScoreLeadingAnchor = awayScoreLabel.leadingAnchor.constraint(equalTo: awayTeamInfoStackView.trailingAnchor)
        awayScoreLeadingAnchor.priority = .defaultLow
        awayScoreLeadingAnchor.isActive = true
        awayScoreLabel.trailingAnchor.constraint(equalTo: versusLabel.leadingAnchor, constant: -8).isActive = true
        awayScoreLabel.centerYAnchor.constraint(equalTo: awayTeamInfoStackView.centerYAnchor).isActive = true
    }
    
    private func configureHomeTeamInfoLayout() {
        homeLogoImageView.image = #imageLiteral(resourceName: "logo.doosan")
        homeLogoImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        homeNameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        homeScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        homeScoreLabel.leadingAnchor.constraint(equalTo: versusLabel.trailingAnchor, constant: 8).isActive = true
        homeScoreLabel.centerYAnchor.constraint(equalTo: homeTeamInfoStackView.centerYAnchor).isActive = true
        
        homeTeamInfoStackView.alignment = .center
        homeTeamInfoStackView.distribution = .fillProportionally
        homeTeamInfoStackView.spacing = 12
        homeTeamInfoStackView.constraints(topAnchor: topAnchor, leadingAnchor: homeScoreLabel.trailingAnchor, bottomAnchor: bottomAnchor, trailingAnchor: trailingAnchor, padding: .init(top: 16, left: 8, bottom: -20, right: -12))
    }
}
