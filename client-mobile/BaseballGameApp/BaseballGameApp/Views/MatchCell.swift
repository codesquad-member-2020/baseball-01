//
//  MatchCell.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchCell: UICollectionViewCell {
    
    static let identifier = "MatchCell"
    static let heightRatio: CGFloat = 0.38
    
    private let awayLogoImageView = LogoImageView()
    private let homeLogoImageView = LogoImageView()
    private let awayLabel = PlainLabel(text: "AWAY", color: .red, fontSize: 13, weight: .medium, alignment: .center)
    private let homeLabel = PlainLabel(text: "HOME", color: .red, fontSize: 13, weight: .medium, alignment: .center)
    private let versusLabel = PlainLabel(text: "VS", color: .black, fontSize: 23, weight: .heavy, alignment: .center)
    
    private let awayNameLabel = PlainLabel(text: "AWAY", color: .black, fontSize: 17, weight: .bold, alignment: .center)
    private let homeNameLabel = PlainLabel(text: "HOME", color: .black, fontSize: 17, weight: .bold, alignment: .center)
    
    private let containerView = UIView()
    private let cornerRadius: CGFloat = 24
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureMatchCell(awayName: String, awayLogoImage: UIImage?, homeName: String, homeLogoImage: UIImage?) {
        self.awayNameLabel.text = awayName
        self.awayLogoImageView.image = awayLogoImage
        self.homeNameLabel.text = homeName
        self.homeLogoImageView.image = homeLogoImage
    }
    
    private func configureUI() {
        addSubview(containerView)
        containerView.layer.cornerRadius = cornerRadius
        containerView.backgroundColor = .init(white: 1, alpha: 0.9)
        containerView.constraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, bottomAnchor: bottomAnchor, trailingAnchor: trailingAnchor)
        containerView.addSubview(versusLabel)
        versusLabel.centerInSuperView()
        
        // Home-Away Labels
        let verticalSpacingFromTeamLabelToContainer: CGFloat = 12.0
        
        containerView.addSubview(awayLabel)
        awayLabel.constraints(topAnchor: containerView.topAnchor, leadingAnchor: containerView.leadingAnchor, bottomAnchor: nil, trailingAnchor: containerView.centerXAnchor, padding: .init(top: verticalSpacingFromTeamLabelToContainer, left: 0, bottom: 0, right: 0))
        awayLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 900), for: .vertical)
        containerView.addSubview(homeLabel)
        homeLabel.constraints(topAnchor: containerView.topAnchor, leadingAnchor: containerView.centerXAnchor, bottomAnchor: nil, trailingAnchor: containerView.trailingAnchor, padding: .init(top: verticalSpacingFromTeamLabelToContainer, left: 0, bottom: 0, right: 0))
        homeLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 900), for: .vertical)
        
        // LogoImageViews
        let verticalSpacingFromLogoImageToTeamLabel: CGFloat = 4.0
        
        containerView.addSubview(awayLogoImageView)
        awayLogoImageView.centerXAnchor.constraint(equalTo: awayLabel.centerXAnchor).isActive = true
        awayLogoImageView.constraints(topAnchor: awayLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: verticalSpacingFromLogoImageToTeamLabel, left: 0, bottom: 0, right: 0))
        
        containerView.addSubview(homeLogoImageView)
        homeLogoImageView.centerXAnchor.constraint(equalTo: homeLabel.centerXAnchor).isActive = true
        homeLogoImageView.constraints(topAnchor: homeLabel.bottomAnchor, leadingAnchor: nil, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: verticalSpacingFromLogoImageToTeamLabel, left: 0, bottom: 0, right: 0))
        
        // TeamNameLabels
        let verticalSpacingFromNameLabelToLogoImage: CGFloat = 4.0
        let verticalSpacingFromContainerToNameLabel: CGFloat = 12.0
        
        containerView.addSubview(awayNameLabel)
        awayNameLabel.constraints(topAnchor: awayLogoImageView.bottomAnchor, leadingAnchor: containerView.leadingAnchor, bottomAnchor: containerView.bottomAnchor, trailingAnchor: containerView.centerXAnchor, padding: .init(top: verticalSpacingFromNameLabelToLogoImage, left: 0, bottom: -verticalSpacingFromContainerToNameLabel, right: 0))
        awayNameLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 900), for: .vertical)
        containerView.addSubview(homeNameLabel)
        homeNameLabel.constraints(topAnchor: homeLogoImageView.bottomAnchor, leadingAnchor: containerView.centerXAnchor, bottomAnchor: containerView.bottomAnchor, trailingAnchor: containerView.trailingAnchor, padding: .init(top: verticalSpacingFromNameLabelToLogoImage, left: 0, bottom: -verticalSpacingFromContainerToNameLabel, right: 0))
        homeNameLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 900), for: .vertical)
    }
}
