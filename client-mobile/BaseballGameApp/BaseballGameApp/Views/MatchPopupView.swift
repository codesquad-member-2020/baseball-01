//
//  MatchPopupView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchPopupView: UIView {
    
    private let cornerRadius: CGFloat = 24.0
    
    private let titleLabel = PlainLabel(text: "플레이할 팀을 선택하세요.", color: .black, fontSize: 17, weight: .medium, alignment: .center)
    private let seperatorView = UIView()
    private let awayLogoImageView = LogoImageView()
    private let homeLogoImageView = LogoImageView()
    private let awayLabel = PlainLabel(text: "AWAY", color: .red, fontSize: 11, weight: .light, alignment: .center)
    private let homeLabel = PlainLabel(text: "HOME", color: .red, fontSize: 11, weight: .light, alignment: .center)
    
    private let awayNameLabel = PlainLabel(text: "AWAY", color: .black, fontSize: 13, weight: .bold, alignment: .center)
    private let homeNameLabel = PlainLabel(text: "HOME", color: .black, fontSize: 13, weight: .bold, alignment: .center)
    
    private let awayTapView = UIView()
    private let homeTapView = UIView()

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
    
    func update(awayName: String,
                awayLogoImage: UIImage?,
                homeName: String,
                homeLogoImage: UIImage?) {
        self.awayNameLabel.text = awayName
        self.awayLogoImageView.image = awayLogoImage
        self.homeNameLabel.text = homeName
        self.homeLogoImageView.image = homeLogoImage
    }
    
    private func configureTapGestures() {
        awayTapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTeam)))
        homeTapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTeam)))
    }
    
    @objc private func didTapTeam(recognizer: UIGestureRecognizer) {
        switch recognizer.view {
        case awayTapView:
            self.postNotification(isAway: true)
        case homeTapView:
            self.postNotification(isAway: false)
        default:
            break
        }
    }
    
    private func postNotification(isAway: Bool) {
        NotificationCenter.default.post(name: .didSelectTeam, object: nil, userInfo: ["isAway": isAway])
    }
    
    private func configureUI() {
        backgroundColor = .init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = .init(width: 0, height: 1.4)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.6
        
        addSubview(titleLabel)
        titleLabel.constraints(topAnchor: self.topAnchor, leadingAnchor: self.leadingAnchor, bottomAnchor: nil, trailingAnchor: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        addSubview(seperatorView)
        seperatorView.backgroundColor = .black
        seperatorView.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: self.bottomAnchor, trailingAnchor: nil, padding: .init(top: 24, left: 0, bottom: -24, right: 0), size: .init(width: 0.5, height: 0))
        seperatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        // Home-Away Labels
        let verticalSpacingFromTeamLabelToContainer: CGFloat = -8.0
        
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
