//
//  RaidsDetailsViewController+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

extension RaidsDetailsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutforViews()
    }

    func createViews() {
        contentStackView = UIStackView()
        view.addSubview(contentStackView)

        imageView = UIImageView()
        contentStackView.addArrangedSubview(imageView)

        raidInfoLabel = UILabel()
        imageView.addSubview(raidInfoLabel)

        creatorInfoLabel = UILabel()
        contentStackView.addArrangedSubview(creatorInfoLabel)

        contendersLabel = UILabel()
        contentStackView.addArrangedSubview(contendersLabel)

        contenderOneLabel = UILabel()
        contentStackView.addArrangedSubview(contenderOneLabel)

        contenderTwoLabel = UILabel()
        contentStackView.addArrangedSubview(contenderTwoLabel)

        contenderThreeLabel = UILabel()
        contentStackView.addArrangedSubview(contenderThreeLabel)

        contenderFourLabel = UILabel()
        contentStackView.addArrangedSubview(contenderFourLabel)

        contenderFiveLabel = UILabel()
        contentStackView.addArrangedSubview(contenderFiveLabel)

        joinButton = UIButton()
        contentStackView.addArrangedSubview(joinButton)

        leaveButton = UIButton()
        contentStackView.addArrangedSubview(leaveButton)

        deleteButton = UIButton()
        contentStackView.addArrangedSubview(deleteButton)
    }

    func styleViews() {
        view.backgroundColor = .white

        styleLabel(label: raidInfoLabel, text: "")
        styleLabel(label: creatorInfoLabel, text: "")
        styleLabel(label: contendersLabel, text: "Contenders")
        styleLabel(label: contenderOneLabel, text: "")
        styleLabel(label: contenderTwoLabel, text: "")
        styleLabel(label: contenderThreeLabel, text: "")
        styleLabel(label: contenderFourLabel, text: "")
        styleLabel(label: contenderFiveLabel, text: "")

        deleteButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        deleteButton.setTitle("Delete raid", for: .normal)
        deleteButton.backgroundColor = .systemRed
        deleteButton.setTitleColor(.black, for: .normal)
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = UIColor.black.cgColor
        deleteButton.layer.cornerRadius = 8
        deleteButton.addTarget(self, action: #selector(handleDeleteRaid), for: .touchUpInside)

        leaveButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        leaveButton.setTitle("Leave raid", for: .normal)
        leaveButton.backgroundColor = .white
        leaveButton.setTitleColor(.black, for: .normal)
        leaveButton.layer.borderWidth = 1
        leaveButton.layer.borderColor = UIColor.black.cgColor
        leaveButton.layer.cornerRadius = 8
        leaveButton.addTarget(self, action: #selector(handleLeaveRaid), for: .touchUpInside)

        joinButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        joinButton.setTitle("Join raid", for: .normal)
        joinButton.backgroundColor = .systemBlue
        joinButton.setTitleColor(.black, for: .normal)
        joinButton.layer.borderWidth = 1
        joinButton.layer.borderColor = UIColor.black.cgColor
        joinButton.layer.cornerRadius = 8
        joinButton.addTarget(self, action: #selector(handleJoinRaid), for: .touchUpInside)

        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        contentStackView.alignment = .fill

        raidInfoLabel.numberOfLines = 0
        creatorInfoLabel.numberOfLines = 0

        imageView.contentMode = .scaleAspectFill
    }

    func defineLayoutforViews() {
        contentStackView.autoPinEdgesToSuperviewMargins()

        joinButton.autoSetDimension(.height, toSize: 50)
        leaveButton.autoSetDimension(.height, toSize: 50)
        deleteButton.autoSetDimension(.height, toSize: 50)

        imageView.autoSetDimension(.height, toSize: 280)

        raidInfoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        raidInfoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        raidInfoLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
    }

    private func styleLabel(label: UILabel, text: String) {
        label.font = UIFont(name: "Courier", size: 20)
        label.text = text
        label.textAlignment = .left
        label.textColor = .black
    }

}
