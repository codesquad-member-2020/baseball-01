//
//  CurrentPitcherHitterView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/13.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

@IBDesignable
class CurrentPitcherHitterView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pitcherNameLabel: UILabel!
    @IBOutlet weak var hitterNameLabel: UILabel!
    @IBOutlet weak var pitcherTeamLogoImageView: UIImageView!
    @IBOutlet weak var hitterTeamLogoImageView: UIImageView!
    @IBOutlet weak var pitcherInfoLabel: UILabel!
    @IBOutlet weak var hitterInfoLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func updatePitcherName(_ pitcherName: String) {
        pitcherNameLabel.text = pitcherName
    }
    
    func updateHitterName(_ hitterName: String) {
        hitterNameLabel.text = hitterName
    }
    
    func updatePitcherTeamLogo(_ logoImage: UIImage?) {
        pitcherTeamLogoImageView.image = logoImage
    }
    
    func updateHitterTeamLogo(_ logoImage: UIImage?) {
        hitterTeamLogoImageView.image = logoImage
    }
    
    func updatePitcherInfo(_ pitcherInfo: String) {
        pitcherInfoLabel.text = pitcherInfo
    }
    
    func updateHitterInfo(_ hitterInfo: String) {
        hitterInfoLabel.text = hitterInfo
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
        contentView.alpha = 0.9
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1.5
        contentView.clipsToBounds = true
    }
}
