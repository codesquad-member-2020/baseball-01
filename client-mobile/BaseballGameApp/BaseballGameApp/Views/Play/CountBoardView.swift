//
//  CountBoardView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/13.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class CountBoardView: UIView {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var ballCountStackView: UIStackView!
    @IBOutlet weak var strikeCountStackView: UIStackView!
    @IBOutlet weak var outCountStackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        let view = Bundle.main.loadNibNamed(NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        configureUI()
    }
    
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.5
        innerView.layer.cornerRadius = 8
    }
    
    func configureCountCircleViews() {
        let height = ballCountStackView.frame.height * 0.7
        ballCountStackView.arrangedSubviews.forEach { $0.layer.cornerRadius = height / 2 }
        strikeCountStackView.arrangedSubviews.forEach { $0.layer.cornerRadius = height / 2 }
        outCountStackView.arrangedSubviews.forEach { $0.layer.cornerRadius = height / 2 }
    }
}
