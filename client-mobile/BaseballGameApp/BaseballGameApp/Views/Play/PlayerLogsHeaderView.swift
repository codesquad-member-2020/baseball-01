//
//  PlayerLogsHeaderView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayerLogsHeaderView: UITableViewHeaderFooterView {

    static let reuseIdentifier: String = String(describing: self)
    static let height: CGFloat = 44
    
    private let playerNumberLabel: PlainLabel = PlainLabel(text: "1", color: .white, fontSize: 14, weight: .medium, alignment: .center)
    private let playerNameLabel: PlainLabel = PlainLabel(text: "류현진", color: .white, fontSize: 17, weight: .semibold, alignment: .center)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        configureUI()
        configureLayout()
    }

    private func configureUI() {
        contentView.backgroundColor = UIColor(named: "board.view")
        playerNumberLabel.backgroundColor = UIColor(named: "count.board.inner.bg")
        playerNumberLabel.layer.borderWidth = 1
        playerNumberLabel.layer.borderColor = UIColor.white.cgColor
        playerNumberLabel.layer.cornerRadius = 4
        addSubview(playerNumberLabel)
        addSubview(playerNameLabel)
    }
    
    private func configureLayout() {
        playerNumberLabel.constraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, bottomAnchor: bottomAnchor, trailingAnchor: nil, padding: .init(top: 12, left: 24, bottom: -12, right: 0), size: .init(width: 32, height: 0))
        playerNameLabel.constraints(topAnchor: nil, leadingAnchor: playerNumberLabel.trailingAnchor, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        playerNameLabel.centerYAnchor.constraint(equalTo: playerNumberLabel.centerYAnchor).isActive = true
    }
}
