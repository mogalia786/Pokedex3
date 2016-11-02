//
//  PokeCell.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView
    @IBOutlet weak var nameLbl: UILabel
    
    var pokemon:Pokemon!
    
    func configureCell(pokemon: Pokemon){
        nameLbl.text=self.pokemon.Name
        thumbImg.image=UIImage(named: "\(self.pokemon.PokedexID)")
        
    }
    
    
    
}
