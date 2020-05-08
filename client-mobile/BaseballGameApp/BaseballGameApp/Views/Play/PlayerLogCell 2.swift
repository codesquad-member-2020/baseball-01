//
//  PlayerLogCell.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/13.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

@IBDesignable
class PlayerLogCell: UITableViewCell {
    
    static let nibName: String = String(describing: PlayerLogCell.self)
    static let identifier: String = "PlayerLogCell"
    @IBOutlet weak var logMessageLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func updateLogMessage(_ message: String) {
        logMessageLabel.text = message
    }
    
    func updateCount(ballCount: Int, strikeCount: Int) {
        let seperator = " - "
        countLabel.text = "\(ballCount)B\(seperator)\(strikeCount)S"
    }
}
