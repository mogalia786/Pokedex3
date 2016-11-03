//
//  PokemonDetailVC3.swift
//  Pokedex3
//
//  Created by ebrahim on 11/3/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import UIKit

class PokemonDetailVC3: UIViewController {
    var pokemon:Pokemon!

    @IBOutlet weak var mainIMG: UIImageView!
    @IBOutlet weak var nameLBL: UILabel!
    
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var typeLBL: UILabel!
    @IBOutlet weak var defenceLBL: UILabel!
    @IBOutlet weak var heightLBL: UILabel!
    @IBOutlet weak var pokedexidLBL: UILabel!
    @IBOutlet weak var weightLBL: UILabel!
    @IBOutlet weak var baseAttackLBL: UILabel!
    @IBOutlet weak var nextEvoLBL: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoLImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLBL.text=pokemon.Name
        mainIMG.image=UIImage(named: "\(pokemon.PokedexID)")
        // Do any additional setup after loading the view.
    }

  
    @IBAction func backBTN(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
