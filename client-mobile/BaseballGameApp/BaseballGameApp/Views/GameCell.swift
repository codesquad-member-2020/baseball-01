//
//  GameCell.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    static let identifier = "GameCell"
    static let height: CGFloat = 112.0
    
    private let containerView = UIView()
    
    private let cornerRadius: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        addSubview(containerView)
        containerView.layer.cornerRadius = cornerRadius
        containerView.backgroundColor = .init(white: 1, alpha: 0.9)
        containerView.constraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, bottomAnchor: bottomAnchor, trailingAnchor: trailingAnchor)
    }
}
