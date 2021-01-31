//
//  RaidCollectionViewCell.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

class RaidCollectionViewCell: UICollectionViewCell {

    var imageView: UIImageView!
    var pokemonNameLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildview()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        defineLayoutforViews()
    }

    func set(pokemonName: String) {
        imageView.image = UIImage(named: pokemonName)
        pokemonNameLabel.text = pokemonName
    }
}
