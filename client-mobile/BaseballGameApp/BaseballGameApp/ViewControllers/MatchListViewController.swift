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
    
    private let intervalTime: CGFloat = 5.0
    
    // AutoLayout properties for animation
    private var popupViewCenterYAnchor: NSLayoutConstraint?
    private var timer = Timer()

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
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(intervalTime), target: self, selector: #selector(reloadMatchList), userInfo: nil, repeats: true)
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
                break
            case .failure(_):
                break
            }
        }
    }
}

extension MatchListViewController {
    
    private func presentMatch() {
        let matchViewController = MatchViewController()
        self.present(matchViewController, animated: true, completion: nil)
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
