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
    
    private let playerNumberLabel: PlainLabel = PlainLabel(text: "1번", color: .white, fontSize: 14, weight: .medium, alignment: .center)
    private let playerNameLabel: PlainLabel = PlainLabel(text: "류현진", color: .white, fontSize: 16, weight: .semibold, alignment: .center)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func updateHeaderView(playerNumber: Int, playerName: String) {
        updatePlayerNumber(playerNumber)
        updatePlayerName(playerName)
    }
    
    private func updatePlayerNumber(_ playerNumber: Int) {
        playerNumberLabel.text = "\(playerNumber)번"
    }
    
    private func updatePlayerName(_ playerName: String) {
        playerNameLabel.text = playerName
    }
    
    private func configure() {
        configureUI()
        configureLayout()
    }

    private func configureUI() {
        contentView.backgroundColor = UIColor(named: "board.view")
        playerNumberLabel.backgroundColor = UIColor(named: "count.board.inner.bg")
        playerNumberLabel.layer.borderWidth = 0.5
        playerNumberLabel.layer.borderColor = UIColor.white.cgColor
        playerNumberLabel.layer.cornerRadius = 4
        addSubview(playerNumberLabel)
        addSubview(playerNameLabel)
    }
    
    private func configureLayout() {
        playerNumberLabel.constraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, bottomAnchor: bottomAnchor, trailingAnchor: nil, padding: .init(top: 10, left: 24, bottom: -10, right: 0), size: .init(width: 40, height: 0))
        playerNameLabel.constraints(topAnchor: nil, leadingAnchor: playerNumberLabel.trailingAnchor, bottomAnchor: nil, trailingAnchor: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        playerNameLabel.centerYAnchor.constraint(equalTo: playerNumberLabel.centerYAnchor).isActive = true
    }
}
