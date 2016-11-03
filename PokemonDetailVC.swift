//
//  PokemonDetailVC.swift
//  Pokedex3
//
//  Created by ebrahim on 11/3/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    var pokemon:Pokemon!
    
    @IBOutlet weak var pokemonNameLbl: UILabel!
    
    @IBOutlet weak var mainPokeImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var nextEvoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonNameLbl.text=pokemon.Name

        // Do any additional setup after loading the view.
    }

  
}
