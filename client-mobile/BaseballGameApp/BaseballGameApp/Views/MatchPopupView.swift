//
//  MatchPopupView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchPopupView: UIView {
    
    private let cornerRadius: CGFloat = 16.0
    
    private let titleLabel = PlainLabel(text: "플레이할 팀을 선택하세요.", color: .white, fontSize: 17, weight: .medium, alignment: .center)
    private let seperatorView = UIView()
    private let awayLogoImageView = LogoImageView()
    private let homeLogoImageView = LogoImageView()
    private let awayLabel = PlainLabel(text: "AWAY", color: UIColor(named: "away.home.label"), fontSize: 11, weight: .semibold, alignment: .center)
    private let homeLabel = PlainLabel(text: "HOME", color: UIColor(named: "away.home.label"), fontSize: 11, weight: .semibold, alignment: .center)
    
    private let awayNameLabel = PlainLabel(text: "AWAY", color: .white, fontSize: 15, weight: .bold, alignment: .center)
    private let homeNameLabel = PlainLabel(text: "HOME", color: .white, fontSize: 15, weight: .bold, alignment: .center)
    
    private let awayTapView = UIView()
    private let homeTapView = UIView()
    
    private var away: Team! {
        didSet {
            awayNameLabel.text = away.name
        }
    }
    private var home: Team! {
        didSet {
            homeNameLabel.text = home.name
        }
    }

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
    
    func update(away: Team,
                awayLogoImage: UIImage?,
                home: Team,
                homeLogoImage: UIImage?) {
        self.away = away
        self.awayLogoImageView.image = awayLogoImage
        self.home = home
        self.homeLogoImageView.image = homeLogoImage
    }
    
    private func configureTapGestures() {
        awayTapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTeam)))
        homeTapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTeam)))
    }
    
    @objc private func didTapTeam(recognizer: UIGestureRecognizer) {
        switch recognizer.view {
        case awayTapView:
            self.postNotification(identifier: away.identifier)
        case homeTapView:
            self.postNotification(identifier: home.identifier)
        default:
            break
        }
    }
    
    private func postNotification(identifier: Int) {
        NotificationCenter.default.post(name: .didSelectTeam, object: nil, userInfo: ["identifier": identifier])
    }
    
    private func configureUI() {
        backgroundColor = UIColor(named: "board.view")
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = .init(width: 0, height: 1.4)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.6
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.constraints(topAnchor: self.topAnchor, leadingAnchor: self.leadingAnchor, bottomAnchor: nil, trailingAnchor: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        addSubview(seperatorView)
        seperatorView.backgroundColor = .white
        seperatorView.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: self.bottomAnchor, trailingAnchor: nil, padding: .init(top: 24, left: 0, bottom: -24, right: 0), size: .init(width: 0.5, height: 0))
        seperatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        // Home-Away Labels
        let verticalSpacingFromTeamLabelToContainer: CGFloat = -20.0
        
        addSubview(awayLabel)
        awayLabel.constraints(topAnchor: nil, leadingAnchor: self.leadingAnchor, bottomAnchor: self.bottomAnchor, trailingAnchor: self.centerXAnchor, padding: .init(top: 0, left: 0, bottom: verticalSpacingFromTeamLabelToContainer, right: 0))
        awayLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        addSubview(homeLabel)
        homeLabel.constraints(topAnchor: nil, leadingAnchor: self.centerXAnchor, bottomAnchor: self.bottomAnchor, trailingAnchor: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: verticalSpacingFromTeamLabelToContainer, right: 0))
        homeLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        // TeamNameLabels
        let verticalSpacingFromPopUpViewToNameLabel: CGFloat = -4.0
        
        addSubview(awayNameLabel)
        awayNameLabel.constraints(topAnchor: nil, leadingAnchor: self.leadingAnchor, bottomAnchor: awayLabel.topAnchor, trailingAnchor: self.centerXAnchor, padding: .init(top: 0, left: 0, bottom: verticalSpacingFromPopUpViewToNameLabel, right: 0))
        awayNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        addSubview(homeNameLabel)
        homeNameLabel.constraints(topAnchor: nil, leadingAnchor: self.centerXAnchor, bottomAnchor: homeLabel.topAnchor, trailingAnchor: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: verticalSpacingFromPopUpViewToNameLabel, right: 0))
        homeNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        // LogoImageViews
        let verticalSpacingFromLogoImageToTitleLabel: CGFloat = 16.0
        let verticalSpacingFromNameLabelToLogoImage: CGFloat = -8.0
        
        addSubview(awayLogoImageView)
        awayLogoImageView.centerXAnchor.constraint(equalTo: awayLabel.centerXAnchor).isActive = true
        awayLogoImageView.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: awayNameLabel.topAnchor, trailingAnchor: nil, padding: .init(top: verticalSpacingFromLogoImageToTitleLabel, left: 0, bottom: verticalSpacingFromNameLabelToLogoImage, right: 0))
        
        addSubview(homeLogoImageView)
        homeLogoImageView.centerXAnchor.constraint(equalTo: homeLabel.centerXAnchor).isActive = true
        homeLogoImageView.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: homeNameLabel.topAnchor, trailingAnchor: nil, padding: .init(top: verticalSpacingFromLogoImageToTitleLabel, left: 0, bottom: verticalSpacingFromNameLabelToLogoImage, right: 0))
        
        // Tap Gestures
        addSubview(awayTapView)
        awayTapView.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: self.leadingAnchor, bottomAnchor: self.bottomAnchor, trailingAnchor: self.centerXAnchor, padding: .init(top: 16, left: 16, bottom: -8, right: -16))
        addSubview(homeTapView)
        homeTapView.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: self.centerXAnchor, bottomAnchor: self.bottomAnchor, trailingAnchor: self.trailingAnchor, padding: .init(top: 16, left: 16, bottom: -8, right: -16))
        configureTapGestures()
    }
}

extension Notification.Name {
    static let didSelectTeam = Notification.Name(rawValue: "didSelectTeam")
}
