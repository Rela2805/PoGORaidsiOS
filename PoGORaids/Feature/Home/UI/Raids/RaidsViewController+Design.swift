//
//  RaidsViewController+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

extension RaidsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutforViews()
    }

    func createViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
    }

    func styleViews() {
        view.backgroundColor = .white

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RaidCollectionViewCell.self, forCellWithReuseIdentifier: "raidCell")

        collectionView.backgroundColor = .white
    }

    func defineLayoutforViews() {
        collectionView.autoPinEdge(toSuperviewMargin: .leading, withInset: 20)
        collectionView.autoPinEdge(toSuperviewMargin: .trailing, withInset: 20)
        collectionView.autoPinEdge(toSuperviewMargin: .top)
        collectionView.autoPinEdge(toSuperviewMargin: .bottom)
    }

}
