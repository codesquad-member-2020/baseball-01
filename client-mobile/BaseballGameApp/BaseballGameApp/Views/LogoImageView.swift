//
//  LogoImageView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/06.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class LogoImageView: UIImageView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 4
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
}
