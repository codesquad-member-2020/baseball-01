//
//  PlayViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    static let identifier: String = "PlayViewController"
    
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
    @IBOutlet weak var playerLogsTableView: PlayerLogsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureCountBoardView()
    }
    
    func requestInitialData(matchIdentifier: Int) {
        PlayConfigurationUseCase.requestInitialData(matchIdentifier: matchIdentifier,
                                                    with: PlayConfigurationUseCase.PlayConfigurationTask(networkDispatcher: NetworkManager())
        ) { (result) in
            switch result {
            case .success(let playConfiguration):
                let away = playConfiguration.away
                let home = playConfiguration.home
            case .failure(_):
                break
            }
        }
    }

    private func configure() {
        configureMatchBoardView()
        configureTableView()
    }
    
    private func configureTableView() {
        playerLogsTableView.dataSource = self
        playerLogsTableView.delegate = self
        let nib = UINib(nibName: PlayerLogCell.nibName, bundle: nil)
        playerLogsTableView.register(nib, forCellReuseIdentifier: PlayerLogCell.identifier)
        playerLogsTableView.register(PlayerLogsHeaderView.self, forHeaderFooterViewReuseIdentifier: PlayerLogsHeaderView.reuseIdentifier)
        playerLogsTableView.allowsSelection = false
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

extension PlayViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PlayerLogsHeaderView.reuseIdentifier) as! PlayerLogsHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        PlayerLogsHeaderView.height
    }
}
