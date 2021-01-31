//
//  RaidsViewController.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

class RaidsViewController: UIViewController {

    var collectionView: UICollectionView!

    private var presenter: RaidsPresenter!
    private var raids: [RaidModel] = []

    convenience init(presenter: RaidsPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true

        presenter.getRaids() { [weak self] raids in
            self?.raids = raids

            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }

}

extension RaidsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        raids.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "raidCell", for: indexPath) as! RaidCollectionViewCell

        cell.set(pokemonName: raids[indexPath.row].pokemon.name)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 80, height: 314)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.handleSelectedItem(raidId: raids[indexPath.row].id)
    }

}
