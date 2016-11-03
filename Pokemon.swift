//
//  Pokemon.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import Foundation
class Pokemon{
    
    private var _name: String!
    private var _pokedexid: Int!
    private var _description:String!
    private var _type: String!
    private var _weight: String!
    private var _height:String!
    private var _defence: String!
    private var _attack: String!
    private var _nextEvoDescription: String!
    
    
    var Name: String{
        return _name
    }
    
    var PokedexID: Int{
        return _pokedexid
    }
    
    var Description:String{
        return _description
    }
    
    var PokeType:String{
        return _type
        
    }
    
    var Weight:String{
        return _weight
    }
    
    var Height:String{
        return _height
    }
    
    var Defence:String{
        
        return _defence
    }
    
    var Attack:String{
        return _attack
    }
    
    init(Name: String, PokedexID: Int, Description: String, PokeType: String, Weight: String, Height: String, Defence: String, Attack: String ){
        
        self._name=Name
        self._pokedexid=PokedexID
        self._description=Description
        self._type=PokeType
        self._weight=Weight
        self._height=Height
        self._defence=Defence
        self._attack=Attack
        
    }
}
