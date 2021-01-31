//
//  CreateRaidViewController.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

class CreateRaidViewController: UIViewController {

    var containerView: UIStackView!
    var minimalLevelLabel: UILabel!
    var minimalLevelTextField: UITextField!
    var pokemonLabel: UILabel!
    var pokemonPicker: UIPickerView!
    var createButton: UIButton!

    private var presenter: CreateRaidPresenter!
    private var pokemons: [PokemonModel] = []

    convenience init(presenter: CreateRaidPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        presenter.getAllPokemons { [weak self] pokemons in
            self?.pokemons = pokemons

            DispatchQueue.main.async { [weak self] in
                self?.pokemonPicker.reloadAllComponents()
            }
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true
    }

    @objc func handleCreate() {
        guard let minimalLevelString = minimalLevelTextField.text, let minimalLevel = Int(minimalLevelString) else { return }

        let pokemonName = pokemons[pokemonPicker.selectedRow(inComponent: 0)]

        presenter.createRaid(minimalLevel: minimalLevel, pokemonName: pokemonName.name)
    }

}

extension CreateRaidViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemons.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pokemons[row].name
    }
}
