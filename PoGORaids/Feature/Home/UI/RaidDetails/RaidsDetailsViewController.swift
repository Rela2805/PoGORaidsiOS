//
//  RaidsDetailsViewController.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

class RaidsDetailsViewController: UIViewController {

    var contentStackView: UIStackView!
    var imageView: UIImageView!
    var raidInfoLabel: UILabel!
    var creatorInfoLabel: UILabel!
    var contendersLabel: UILabel!
    var contenderOneLabel: UILabel!
    var contenderTwoLabel: UILabel!
    var contenderThreeLabel: UILabel!
    var contenderFourLabel: UILabel!
    var contenderFiveLabel: UILabel!

    var contendersLabels: [UILabel] {
        [
            contenderOneLabel,
            contenderTwoLabel,
            contenderThreeLabel,
            contenderFourLabel,
            contenderFiveLabel
        ]
    }

    var joinButton: UIButton!
    var leaveButton: UIButton!
    var deleteButton: UIButton!

    private var presenter: RaidsDetailsPresenter!

    convenience init(presenter: RaidsDetailsPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        bindPresenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = false
    }

    func bindPresenter() {
        presenter.getRaidInfo { [weak self] raidInfo in
            self?.updateUI(raidModel: raidInfo)
        }
    }

    @objc func handleJoinRaid() {
        presenter.joinRaid { [weak self] raidInfo in
            self?.updateUI(raidModel: raidInfo)
        }
    }

    @objc func handleLeaveRaid() {
        presenter.leaveRaid { [weak self] raidInfo in
            self?.updateUI(raidModel: raidInfo)
        }
    }

    @objc func handleDeleteRaid() {
        presenter.deleteRaid()
    }

    private func updateUI(raidModel: RaidDetailsViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.imageView.image = UIImage(named: raidModel.pokemonImage)
            self?.raidInfoLabel.text = "Info: \(raidModel.pokemonName) - min lvl: \(raidModel.minimalLevel)"
            self?.creatorInfoLabel.text = "Creator: \(raidModel.creator.code) - \(raidModel.creator.nickname) - \(raidModel.creator.level)"

            for (index, contender) in raidModel.contenders.enumerated() {
                self?.contendersLabels[index].text = "\(contender.code) - \(contender.level)"
            }
        }
    }
}
