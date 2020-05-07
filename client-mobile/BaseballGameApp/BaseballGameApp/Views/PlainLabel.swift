//
//  PlainLabel.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlainLabel: UILabel {
    
    init(text: String = "", color: UIColor = .black, fontSize: CGFloat = 14, weight: UIFont.Weight = .medium, alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textAlignment = alignment
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
