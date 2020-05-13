//
//  PlayingTeamIndexBar.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/13.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

@IBDesignable
class PlayingTeamIndexBar: UIView {

    private let cornerRadius: CGFloat = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = cornerRadius
        alpha = 0
    }
}
