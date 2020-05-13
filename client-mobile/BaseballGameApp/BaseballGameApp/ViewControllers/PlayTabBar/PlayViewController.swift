//
//  PlayViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var matchBoardView: MatchBoardView!
    @IBOutlet weak var awayLogoImageView: UIImageView!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var awayPlayingBar: UIView!
    @IBOutlet weak var homeLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homePlayingBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var inningLabel: UILabel!
    
    @IBOutlet weak var countBoardView: CountBoardView!
    @IBOutlet weak var playerLogsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    private func configure() {
        configureMatchBoardView()
        configureCountBoardView()
        configureTableView()
    }
    
    private func configureTableView() {
        playerLogsTableView.dataSource = self
        let nib = UINib(nibName: PlayerLogCell.nibName, bundle: nil)
        playerLogsTableView.register(nib, forCellReuseIdentifier: PlayerLogCell.identifier)
    }
    
    private func configureCountBoardView() {
        view.layoutIfNeeded()
        countBoardView.configureCountCircleViews()
    }
    
    private func configureMatchBoardView() {
        matchBoardView.configureUIProperties(awayLogoImageView: awayLogoImageView,
                                             awayTeamLabel: awayTeamLabel,
                                             awayPlayingBar: awayPlayingBar,
                                             homeLogoImageView: homeLogoImageView,
                                             homeTeamLabel: homeTeamLabel,
                                             homePlayingBar: homePlayingBar,
                                             scoreLabel: scoreLabel,
                                             inningLabel: inningLabel)
    }
}

extension PlayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerLogCell.identifier, for: indexPath) as! PlayerLogCell
        return cell
    }
}
