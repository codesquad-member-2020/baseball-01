//
//  GameListCollectionView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchListCollectionView: UICollectionView {

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        configureCollectionView()
        configureUI()
    }
    
    private func configureCollectionView() {
        delegate = self
        self.register(MatchCell.self, forCellWithReuseIdentifier: MatchCell.reuseIdentifier)
    }
    
    private func configureUI() {
        self.showsVerticalScrollIndicator = false
    }
}

extension MatchListCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.width * MatchCell.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .didSelectMatch, object: nil, userInfo: ["indexPath": indexPath])
    }
}

extension Notification.Name {
    static let didSelectMatch = Notification.Name(rawValue: "didSelectMatch")
}
