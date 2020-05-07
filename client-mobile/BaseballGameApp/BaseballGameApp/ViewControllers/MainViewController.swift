//
//  MainViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/07.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private let backgroundImageView = UIImageView(image: UIImage(named: "signin.main"))
    private let alphaView = UIView()
    private let titleLabel = PlainLabel(text: "CODE\nSTRIKE", color: .white, fontSize: 64, weight: .heavy, alignment: .center)
    private let subtitleLabel = PlainLabel(text: "O n l i n e   B a s e b a l l   G a m e", color: .white, fontSize: 14, weight: .light, alignment: .center)
    private let startLabel = PlainLabel(text: "T A P   T O   S T A R T", color: .white, fontSize: 16, weight: .medium, alignment: .center)
    private let startTapView = UIView()
    private let startButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showTitleLabel()
    }
    
    private func configureButton() {
        startButton.addTarget(self, action: #selector(didTapGameStart), for: .touchUpInside)
    }
    
    private func showTitleLabel() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.titleLabel.alpha = 1
        }, completion: { _ in
            self.showSubtitleLabel()
        })
    }
    
    private func showSubtitleLabel() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
            self.subtitleLabel.alpha = 1
        }, completion: { _ in
            self.showTapToStart()
        })
    }
    
    private func showTapToStart() {
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.startLabel.alpha = 1
        }, completion: { _ in
            self.configureTapGestureRecognizer()
        })
    }
    
    @objc private func didTapGameStart() {
           self.dismiss(animated: true, completion: nil)
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
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.startButton.alpha = 1
            self.startButton.transform = .identity
        })
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
        titleLabel.alpha = 0
        
        view.addSubview(subtitleLabel)
        subtitleLabel.alpha = 0
        subtitleLabel.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 16, left: titleImageSidePadding, bottom: 0, right: -titleImageSidePadding))
        
        view.addSubview(startLabel)
        startLabel.alpha = 0
        startLabel.constraints(topAnchor: subtitleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 140, left: 48, bottom: 0, right: -48))
        
        view.addSubview(startTapView)
        startTapView.backgroundColor = .clear
        startTapView.fillSuperView()
        
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
        startButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 64).isActive = true
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
        
        let scale = CGAffineTransform(scaleX: 0.1, y: 0.1)
        let rotate = CGAffineTransform(rotationAngle: 180 * .pi / 180)
        startButton.transform = scale.concatenating(rotate)
        
        view.layoutIfNeeded()
    }
}
