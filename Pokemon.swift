//
//  Pokemon.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import Foundation
class Pokemon{
    
    private var _name: String
    private var _pokedexid: Int
    
    var Name: String{
        return _name
    }
    
    var PokedexID: Int{
        return _pokedexid
    }
    
    init(Name: String, PokedexID: Int){
        
        self._name=Name
        self._pokedexid=PokedexID
        
    }
}
