//
//  SignInViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/07.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    private let backgroundImageView = UIImageView(image: UIImage(named: "signin.main"))
    private let alphaView = UIView()
    private let titleLabel = PlainLabel(text: "CODE\nSTRIKE", color: .white, fontSize: 64, weight: .heavy, alignment: .center)
    private let subtitleLabel = PlainLabel(text: "O n l i n e   B a s e b a l l   G a m e", color: .white, fontSize: 14, weight: .light, alignment: .center)
    private let startLabel = PlainLabel(text: "T A P   T O   S T A R T", color: .white, fontSize: 16, weight: .medium, alignment: .center)
    private let startTapView = UIView()
    
    private let startButton = UIButton(type: .custom)
    private var buttonTapAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        let topBottomPadding: CGFloat = 56.0
        view.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.constraints(topAnchor: view.topAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: view.bottomAnchor, trailingAnchor: view.trailingAnchor, padding: .init(top: topBottomPadding, left: 0, bottom: -topBottomPadding, right: 0))
        
        view.addSubview(alphaView)
        alphaView.backgroundColor = .black
        alphaView.alpha = 0.7
        alphaView.fillSuperView()
        
        let titleImageSidePadding: CGFloat = 12.0
        
        view.addSubview(titleLabel)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "BungeeOutline-Regular", size: 72)
        titleLabel.constraints(topAnchor: view.topAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: view.frame.height * 0.3, left: titleImageSidePadding, bottom: 0, right: -titleImageSidePadding))
        
        view.addSubview(subtitleLabel)
        subtitleLabel.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 16, left: titleImageSidePadding, bottom: 0, right: -titleImageSidePadding))
        
        view.addSubview(startLabel)
        startLabel.constraints(topAnchor: subtitleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 140, left: 48, bottom: 0, right: -48))
        
        view.addSubview(startTapView)
        startTapView.backgroundColor = .clear
        startTapView.fillSuperView()
        configureTapGestureRecognizer()
        
        view.addSubview(startButton)
        // startButton Title
        startButton.setTitle("GAME\nSTART", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.numberOfLines = 0
        
        // startButton background & Layout
        startButton.backgroundColor = .clear
        startButton.alpha = 0
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 108).isActive = true
        startButton.heightAnchor.constraint(equalTo: startButton.widthAnchor, multiplier: 1).isActive = true
        
        // startButton Image
        startButton.setBackgroundImage(UIImage(named: "baseball")?.withRenderingMode(.alwaysOriginal), for: .normal)
        startButton.layoutIfNeeded()
        startButton.subviews.first?.contentMode = .scaleAspectFit
        startButton.subviews.first?.alpha = 0.75
        // startButton Shadow
        startButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        startButton.titleLabel?.layer.shadowOffset = .init(width: 1, height: 1.5)
        startButton.titleLabel?.layer.masksToBounds = false
        startButton.titleLabel?.layer.shadowOpacity = 0.8
        startButton.titleLabel?.layer.shadowRadius = 1.0
        startButton.titleLabel?.layer.shadowColor = UIColor.darkGray.cgColor
        
        buttonTapAnchor = NSLayoutConstraint(item: startButton, attribute: .top, relatedBy: .equal, toItem: subtitleLabel, attribute: .bottom, multiplier: 1, constant: view.frame.height * 0.3)
        buttonTapAnchor?.isActive = true
        
        view.layoutIfNeeded()
    }
    
    private func configureTapGestureRecognizer() {
        startTapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapStart)))
    }
    
    @objc private func didTapStart() {
        startTapView.removeFromSuperview()
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.startLabel.alpha = 0
        }, completion: { _ in
            self.startLabel.removeFromSuperview()
            self.showButtons()
        })
    }
    
    private func showButtons() {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.buttonTapAnchor?.constant = 64
            self.startButton.alpha = 1
            self.view.layoutIfNeeded()
        })
    }
}
