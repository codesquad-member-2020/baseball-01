//
//  PlayerLogsTableDataSource.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayerLogsTableDataSource: NSObject, UITableViewDataSource {
    
    private var playerLogs: [[PlayerLog]] = []
    
    func configurePlayerLogs(_ playerLogs: [[PlayerLog]]) {
        self.playerLogs = playerLogs
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        playerLogs.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playerLogs[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerLogCell.identifier, for: indexPath) as! PlayerLogCell
        return cell
    }
}
