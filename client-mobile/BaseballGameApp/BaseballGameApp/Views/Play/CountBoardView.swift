//
//  CountBoardView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/13.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

@IBDesignable
class CountBoardView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var ballCountStackView: UIStackView!
    @IBOutlet weak var strikeCountStackView: UIStackView!
    @IBOutlet weak var outCountStackView: UIStackView!
    
    enum CountType: String {
        case ball = "ball"
        case strike = "strike"
        case out = "out"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        let bundle = Bundle(for: Self.self)
        bundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        configureUI()
    }
    
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        innerView.layer.cornerRadius = 8
    }
    
    func updateCount(type: CountType, count: Int) {
        var filledCount = 0
        var fillColor: UIColor!
        var countStackView: UIStackView!
        switch type {
        case .ball:
            fillColor = UIColor(named: "count.board.ball")
            countStackView = ballCountStackView
        case .strike:
            fillColor = UIColor(named: "count.board.strike")
            countStackView = strikeCountStackView
        case .out:
            fillColor = UIColor(named: "count.board.out")
            countStackView = outCountStackView
        }
        countStackView.arrangedSubviews.forEach {
            guard filledCount < count else { return }
            filledCount += 1
            $0.backgroundColor = fillColor
        }
    }
    
    func configureCountCircleViews() {
        let height = ballCountStackView.frame.height * 0.7
        ballCountStackView.arrangedSubviews.forEach { $0.layer.cornerRadius = height / 2 }
        strikeCountStackView.arrangedSubviews.forEach { $0.layer.cornerRadius = height / 2 }
        outCountStackView.arrangedSubviews.forEach { $0.layer.cornerRadius = height / 2 }
    }
}
