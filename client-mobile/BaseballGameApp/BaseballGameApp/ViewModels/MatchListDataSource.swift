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
        let match = matchList[indexPath.item]
        let awayTeam = match.awayTeam
        let homeTeam = match.homeTeam
        
        cell.updateIdentifier(match.identifier)
        DispatchQueue.main.async {
            cell.updateTeam(away: awayTeam, home: homeTeam)
        }
        
        fetchImageWithCaching(imageURL: awayTeam.logoImage) { (image) in
            DispatchQueue.main.async {
                cell.updateLogoImage(image, isAway: true)
            }
        }
        fetchImageWithCaching(imageURL: homeTeam.logoImage) { (image) in
            DispatchQueue.main.async {
                cell.updateLogoImage(image, isAway: false)
            }
        }
        return cell
    }
    
    private func fetchImageWithCaching(imageURL: String, completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: imageURL)!
        let cachedImageFileURL = try! FileManager.default.url(for: .cachesDirectory,
                                                              in: .userDomainMask,
                                                              appropriateFor: nil,
                                                              create: true)
                                                 .appendingPathComponent(url.lastPathComponent)
        if let cachedData = try? Data(contentsOf: cachedImageFileURL) {
            let image = UIImage(data: cachedData)
            completion(image)
        } else {
            ImageNetworkManager.fetchImage(from: imageURL, cachedImageFileURL: cachedImageFileURL) { (image) in
                completion(image)
            }
        }
    }
}

extension Notification.Name {
    static let didUpdateMatchList = Notification.Name(rawValue: "didUpdateMatchList")
}
