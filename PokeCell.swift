//
//  PokeCell.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon:Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius=5.0
    
    }
    
    func configureCell(pokemon: Pokemon){
        self.pokemon=pokemon
        nameLbl.text=self.pokemon.Name.capitalized
        thumbImg.image=UIImage(named: "\(self.pokemon.PokedexID)")
        
    }
    
    
    
}
