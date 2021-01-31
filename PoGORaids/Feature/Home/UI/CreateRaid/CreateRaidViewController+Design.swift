//
//  CreateRaidViewController+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

extension CreateRaidViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutforViews()
    }

    func createViews() {
        containerView = UIStackView()
        view.addSubview(containerView)

        minimalLevelLabel = UILabel()
        containerView.addArrangedSubview(minimalLevelLabel)

        minimalLevelTextField = UITextField()
        containerView.addArrangedSubview(minimalLevelTextField)

        pokemonLabel = UILabel()
        containerView.addArrangedSubview(pokemonLabel)

        pokemonPicker = UIPickerView()
        containerView.addArrangedSubview(pokemonPicker)

        createButton = UIButton()
        containerView.addArrangedSubview(createButton)
    }

    func styleViews() {

        view.backgroundColor = .white

        minimalLevelLabel.font = UIFont(name: "Courier", size: 20)
        minimalLevelLabel.text = "Minimal level:"
        minimalLevelLabel.textAlignment = .left
        minimalLevelLabel.textColor = .black

        pokemonLabel.font = UIFont(name: "Courier", size: 20)
        pokemonLabel.text = "Choose Pokemon boss:"
        pokemonLabel.textAlignment = .left
        pokemonLabel.textColor = .black

        minimalLevelTextField.font = UIFont(name: "Courier", size: 20)
        minimalLevelTextField.textColor = .black
        minimalLevelTextField.layer.borderWidth = 1
        minimalLevelTextField.layer.borderColor = UIColor.black.cgColor

        createButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        createButton.setTitle("Create raid", for: .normal)
        createButton.backgroundColor = .systemBlue
        createButton.setTitleColor(.black, for: .normal)
        createButton.layer.cornerRadius = 8
        createButton.addTarget(self, action: #selector(handleCreate), for: .touchUpInside)

        containerView.axis = .vertical
        containerView.spacing = 20
        containerView.alignment = .fill

        pokemonPicker.delegate = self
        pokemonPicker.dataSource = self
    }

    func defineLayoutforViews() {
        containerView.autoCenterInSuperview()
        containerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        containerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)

        createButton.autoSetDimension(.height, toSize: 50)

        minimalLevelTextField.autoSetDimension(.height, toSize: 40)
        pokemonPicker.autoSetDimension(.height, toSize: 150)

    }

}
