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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        backgroundColor = .red
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = .init(width: 0, height: 1.4)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.6
    }
}
