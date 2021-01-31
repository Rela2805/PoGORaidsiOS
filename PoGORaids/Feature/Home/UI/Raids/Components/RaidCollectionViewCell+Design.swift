//
//  RaidCollectionViewCell+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

extension RaidCollectionViewCell: ConstructViewsProtocol {
    func buildview() {
        createViews()
        styleViews()
    }

    func createViews() {
        imageView = UIImageView()
        addSubview(imageView)

        pokemonNameLabel = UILabel()
        addSubview(pokemonNameLabel)
    }

    func styleViews() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 16

        pokemonNameLabel.font = UIFont(name: "Courier", size: 34)
        pokemonNameLabel.textAlignment = .left
        pokemonNameLabel.textColor = .black
    }

    func defineLayoutforViews() {
        guard superview != nil else { return }

        imageView.autoPinEdgesToSuperviewEdges()

        pokemonNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        pokemonNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        pokemonNameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
    }


}
