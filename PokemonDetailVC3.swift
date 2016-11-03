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
