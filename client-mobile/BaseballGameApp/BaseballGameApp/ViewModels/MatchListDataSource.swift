//
//  MatchListDataSource.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchListDataSource: NSObject, UICollectionViewDataSource {
    
    private var matchList: [Match] = [] {
        didSet {
            postNotification()
        }
    }
    
    func updateMatchList(_ matchList: [Match]) {
        self.matchList = matchList
    }
    
    private func postNotification() {
        NotificationCenter.default.post(name: .didUpdateMatchList, object: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchCell.reuseIdentifier, for: indexPath) as! MatchCell
        return cell
    }
}

extension Notification.Name {
    static let didUpdateMatchList = Notification.Name(rawValue: "didUpdateMatchList")
}
