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
    @IBOutlet weak var descLBL: UILabel!
    @IBOutlet weak var typeLBL: UILabel!
    @IBOutlet weak var heightLBL: UILabel!
    @IBOutlet weak var weightLBL: UILabel!
    @IBOutlet weak var defenceLBL: UILabel!
    @IBOutlet weak var attackLBL: UILabel!
    @IBOutlet weak var pokemonIDLBL: UILabel!
    @IBOutlet weak var nextGenDescLBL: UILabel!
    @IBOutlet weak var currentPokemonImg: UIImageView!
    @IBOutlet weak var nextPokemonImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLBL.text=pokemon.Name.capitalized
        pokemon.DownLoadPokemon(){
            self.updateGUI()
            print("came here")
        }
                // Do any additional setup after loading the view.
    }
    func updateGUI(){
        
        //code to update GUI
        
        mainIMG.image=UIImage(named: "\(pokemon.PokedexID)")
        currentPokemonImg.image=UIImage(named: "\(pokemon.PokedexID)")
        heightLBL.text=pokemon.Height
        weightLBL.text=pokemon.Weight
        defenceLBL.text=pokemon.Defence
        attackLBL.text=pokemon.Attack
        typeLBL.text=pokemon.PokeType
        pokemonIDLBL.text="\(pokemon.PokedexID)"
        descLBL.text=pokemon.Description
        
        if pokemon.NextEvoID==""{
            nextPokemonImg.isHidden=true
            nextGenDescLBL.text="No New Generation"
        
        }else{
          let str="Next Evolution \(pokemon.NextEvoNAME) - LVL \(pokemon.NextEvoLVL)"
            nextGenDescLBL.text=str
            nextPokemonImg.isHidden=false
            nextPokemonImg.image=UIImage(named: "\(pokemon.NextEvoID)")
        }
    }
  
    @IBAction func backBTN(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
