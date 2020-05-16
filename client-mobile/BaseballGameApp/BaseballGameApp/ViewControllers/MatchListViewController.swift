//
//  MatchListViewController.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class MatchListViewController: UIViewController {
    
    private let titleLabel = PlainLabel(text: "Match List", color: .white, fontSize: 32, weight: .semibold, alignment: .center)
    private let descriptionLabel = PlainLabel(text: "플레이할 매치를 선택하세요", color: .white, fontSize: 16, weight: .medium, alignment: .center)
    
    private var popupView: MatchPopupView!
    private var popupBackgroundView: UIView!
    
    private var hasEnteredFromMain = false
    private let enterTransitionView = UIView()
    
    private let collectionView = MatchListCollectionView()
    private let matchListDataSource = MatchListDataSource()
    
    private var waitingView: UIView!
    
    private let reloadMatchListIntervalTime: CGFloat = 5.0
    private var reloadMatchListTimer = Timer()
    
    private let findingOppositeIntervalTime: CGFloat = 3.0
    private var findingOppositeTimer = Timer()
    
    // AutoLayout properties for animation
    private var popupViewCenterYAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNotification()
        configureCollectionView()
        requestMatchList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadMatchListPeriodically()
        
        guard !hasEnteredFromMain else { return }
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: false, completion: {
            mainViewController.delegate = self
        })
    }
    
    private func reloadMatchListPeriodically() {
        reloadMatchListTimer = Timer.scheduledTimer(timeInterval: TimeInterval(reloadMatchListIntervalTime), target: self, selector: #selector(reloadMatchList), userInfo: nil, repeats: true)
    }
    
    @objc private func reloadMatchList() {
        requestMatchList()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .didSelectMatch, object: nil)
        NotificationCenter.default.removeObserver(self, name: .didSelectTeam, object: nil)
        NotificationCenter.default.removeObserver(self, name: .didUpdateMatchList, object: nil)
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = matchListDataSource
    }
    
    private func requestMatchList() {
        MatchListUseCase.getMatchList(from: MatchListUseCase.MatchListRequest(),
                                      with: MatchListUseCase.MatchListTask(networkDispatcher: NetworkManager())
        ) { (result) in
            switch result {
            case .success(let matchList):
                DispatchQueue.main.async {
                    self.matchListDataSource.updateMatchList(matchList.data)
                }
            case .failure(_):
                break
            default:
                break
            }
        }
    }

    // MARK:- UI
    private func configureUI() {
        let imageView = UIImageView(image: UIImage(named: "matchlist.bg"))
        imageView.contentMode = .scaleAspectFill
        let backgroundEffectView = UIView()
        backgroundEffectView.backgroundColor = .black
        backgroundEffectView.alpha = 0.6
        
        view.addSubview(imageView)
        view.addSubview(backgroundEffectView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        view.addSubview(enterTransitionView)
        
        imageView.fillSuperView()
        backgroundEffectView.fillSuperView()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 2.8, constant: 0).isActive = true
        descriptionLabel.constraints(topAnchor: titleLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: nil, trailingAnchor: view.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .clear
        collectionView.constraints(topAnchor: descriptionLabel.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: view.bottomAnchor, trailingAnchor: view.trailingAnchor, padding: .init(top: 28, left: 32, bottom: -16, right: -32))
        enterTransitionView.backgroundColor = .black
        enterTransitionView.fillSuperView()
    }
}

extension MatchListViewController: MainViewControllerDelegate {
    func didTapGameStart() {
        self.hasEnteredFromMain = true
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.enterTransitionView.alpha = 0
        }, completion: { _ in
            self.enterTransitionView.removeFromSuperview()
        })
    }
}

// MARK:- Notification
extension MatchListViewController {
    
    private func configureNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didTapMatchCell),
                                               name: .didSelectMatch,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didSelectTeam),
                                               name: .didSelectTeam,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didUpdateMatchList),
                                               name: .didUpdateMatchList,
                                               object: nil)
    }
    
    @objc private func didUpdateMatchList(notification: Notification) {
        self.collectionView.reloadData()
    }
    
    @objc func didTapMatchCell(notification: Notification) {
        guard let indexPath = notification.userInfo?["indexPath"] as? IndexPath else { return }
        showPopupView(at: indexPath)
    }
    
    // MARK:- Select Team
    @objc private func didSelectTeam(notification: Notification) {
        guard
            let matchIdentifier = notification.userInfo?["matchIdentifier"] as? Int,
            let teamIdentifier = notification.userInfo?["teamIdentifier"] as? Int
        else { return }
        SelectTeamUseCase.requestSelectTeam(matchIdentifier: matchIdentifier,
                                            teamIdentifier: teamIdentifier,
                                            with: SelectTeamUseCase.SelectTeamTask(networkDispatcher: NetworkManager())
        ) { (result) in
            switch result {
            case .success(let selectingStatus):
                let message = selectingStatus.message
                switch message {
                case "매치 상대를 찾고 있습니다.":
                    DispatchQueue.main.async {
                        self.showWaitingView(message: message)
                        self.configureFindOppositePeriodically(matchIdentifier: matchIdentifier, teamIdentifier: teamIdentifier)
                    }
                case "다른 유저가 대기 중입니다. 다른 팀을 골라주세요.":
                    DispatchQueue.main.async {
                        self.showAlertView(message: message)
                    }
                case "매치가 완료 되었습니다.":
                    DispatchQueue.main.async {
                        self.invalidateTimers()
                        self.presentMatch(matchIdentifier: matchIdentifier, teamIdentifier: teamIdentifier)
                    }
                default:
                    break
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func configureFindOppositePeriodically(matchIdentifier: Int, teamIdentifier: Int) {
        findingOppositeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(findingOppositeIntervalTime),
                                                    target: self,
                                                    selector: #selector(selectTeam),
                                                    userInfo: ["matchIdentifier": matchIdentifier,
                                                               "teamIdentifier": teamIdentifier],
                                                    repeats: true)
    }
    
    @objc private func selectTeam(timer: Timer) {
        guard
            let userInfo = timer.userInfo as? [String: Int],
            let matchIdentifier = userInfo["matchIdentifier"],
            let teamIdentifier = userInfo["teamIdentifier"]
        else { return }
        MatchStatusUseCase.requestMatchStatus(matchIdentifier: matchIdentifier,
                                              with: MatchStatusUseCase.MatchStatusTask(networkDispatcher: NetworkManager())
        ) { (result) in
            switch result {
            case .success(let matchStatus):
                let data = matchStatus.data
                let away = data.away
                let home = data.home
                guard away.isReady && home.isReady else { return }
                DispatchQueue.main.async {
                    self.invalidateTimers()
                    self.presentMatch(matchIdentifier: matchIdentifier, teamIdentifier: teamIdentifier)
                }
            case .failure(_):
                break
            }
        }
    }
}

extension MatchListViewController {
    
    private func invalidateTimers() {
        reloadMatchListTimer.invalidate()
        findingOppositeTimer.invalidate()
    }
    
    private func presentMatch(matchIdentifier: Int, teamIdentifier: Int) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let matchViewController = mainStoryboard.instantiateViewController(identifier: MatchViewController.identifier) as! MatchViewController
        matchViewController.modalPresentationStyle = .fullScreen
        self.present(matchViewController, animated: true, completion: {
            guard let playViewController = matchViewController.viewControllers?.first as? PlayViewController else { return }
            playViewController.requestInitialData(matchIdentifier: matchIdentifier, teamIdentifier: teamIdentifier)
        })
    }
    
    private func showWaitingView(message: String) {
        waitingView = UIView()
        waitingView.backgroundColor = .black
        waitingView.alpha = 0.9
        view.addSubview(waitingView)
        waitingView.fillSuperView()
        
        let messageLabel = PlainLabel(text: message, color: .white, fontSize: 20, weight: .semibold, alignment: .center)
        waitingView.addSubview(messageLabel)
        messageLabel.centerInSuperView()
        
        UIView.animate(withDuration: 1.2, delay: 0, options: [.repeat, .autoreverse], animations: {
            messageLabel.alpha = 0
        }, completion: nil)
    }
    
    private func showAlertView(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK:- Pop up View
extension MatchListViewController {
    
    private func showPopupView(at indexPath: IndexPath) {
        self.popupView = MatchPopupView()
        self.popupBackgroundView = UIView()
        view.addSubview(popupBackgroundView)
        popupBackgroundView.backgroundColor = .black
        popupBackgroundView.alpha = 0
        popupBackgroundView.fillSuperView()
        view.addSubview(popupView)
        popupView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: popupView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        popupViewCenterYAnchor = popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 800)
        popupViewCenterYAnchor?.isActive = true
        popupView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        popupView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        popupView.alpha = 0
        view.layoutIfNeeded()
        
        // Configure Pop-up View
        let cell = collectionView.cellForItem(at: indexPath) as! MatchCell
        cell.pass { (identifier, away, awayLogo, home, homeLogo) in
            popupView.update(matchIdentifier: identifier,
                             away: away,
                             awayLogoImage: awayLogo,
                             home: home,
                             homeLogoImage: homeLogo)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.popupViewCenterYAnchor?.constant = -20
            self.popupView.alpha = 1
            self.popupBackgroundView.alpha = 0.6
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.popupBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapPopupBackgroundView)))
        })
    }
    
    @objc private func didTapPopupBackgroundView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.popupViewCenterYAnchor?.constant = 800
            self.popupView.alpha = 0
            self.popupBackgroundView.alpha = 0
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.popupView.removeFromSuperview()
            self.popupBackgroundView.removeFromSuperview()
        })
    }
}
