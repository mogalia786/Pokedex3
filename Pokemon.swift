//
//  Pokemon.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import Foundation
import Alamofire
class Pokemon{
    
    private var _name: String!
    private var _pokedexid: Int!
    private var _description:String!
    private var _type: String!
    private var _weight: String!
    private var _height:String!
    private var _defence: String!
    private var _attack: String!
    private var _nextEvoTEXT: String!
    private var _nextEvoNAME: String!
    private var _nextEvoID: String!
    private var _nextEvoLVL: String!
    private var _pokemonURL: String!
    
    
    var NextEvoLVL:String{
        if self._nextEvoLVL==nil{
            self._nextEvoLVL=""
        }
        return _nextEvoLVL
    }

    
    var NextEvoID:String{
        if self._nextEvoID==nil{
            self._nextEvoID=""
        }
        return _nextEvoID
    }

    
    var NextEvoNAME:String{
        if self._nextEvoNAME==nil{
            self._nextEvoNAME=""
        }
        return _nextEvoNAME
    }

    
    var NextEvoText:String{
        if self._nextEvoTEXT==nil{
            self._nextEvoTEXT=""
        }
    return _nextEvoTEXT
    }
    
    var Name: String{
        return _name
    }
    
    var PokedexID: Int{
        return _pokedexid
    }
    
    var Description:String{
        if self._description==nil{
            self._description=""
        }
        return _description
    }
    
    var PokeType:String{
        if self._type==nil{
            self._type=""
        }
        return _type
        
    }
    
    var Weight:String{
        
        if self._weight==nil{
            self._weight=""
        }
        return _weight
    }
    
    var Height:String{
        if self._height==nil{
            self._height=""
        }
        return _height
    }
    
    var Defence:String{
        if self._defence==nil{
            self._defence=""
        }
        return _defence
    }
    
    var Attack:String{
        if self._attack==nil{
            self._attack=""
        }
        return _attack
    }
    
    
    
    init(Name: String, PokedexID: Int){
        
        self._name=Name
        self._pokedexid=PokedexID
        self._pokemonURL="\(BASE_URL)\(self.PokedexID)/"
        print("FAIZEL \(self._pokemonURL)")
        
    }
    
    func DownLoadPokemon(completed: @escaping DownloadCompleted){
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            print(response.result.value)
            if let dict=response.result.value as? Dictionary<String, AnyObject>{
                if let weight=dict["weight"] as? String{
                    self._weight=weight
                }
                if let height=dict["height"] as? String{
                    self._height=height
                }
                if let attack=dict["attack"] as? Int{
                    self._attack="\(attack)"
                }
                if let defence=dict["defense"] as? Int{
                    self._defence="\(defence)"
                }
                if let types=dict["types"] as? [Dictionary<String, String>], types.count > 0{
                    
                    if let name=types[0]["name"]
                    {
                        self._type=self.Name.capitalized
                    }
                    if types.count>1{
                        
                        for X in 1..<types.count{
                            
                            if let name=types[X]["name"]{
                                self._type! += "/\(name.capitalized)"

                            }
                        }
                    }
                  print(self._type)
                    
                }else{
                    
                   self._type=""
                }
                if let descArray=dict["descriptions"] as? [Dictionary<String, String>], descArray.count>0{
                    
                    if let URL=descArray[0]["resource_uri"] {
                        var descURL="\(START_URL)\(URL)"
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            if let descDICT=response.result.value as? Dictionary<String, AnyObject>{
                                
                                if let description=descDICT["description"] as? String{
                                    let newDescription=description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    print(description)
                                    print(newDescription)
                                    self._description=newDescription
                                    
                                }
                            }
                            completed()
                        })
                    }
                }else{
                    self._description=""
                }
                
                if let evolutions=dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count>0{
                    
                    if let nextEvo=evolutions[0]["to"] as? String{
                        
                        if nextEvo.range(of: "mega")==nil{
                            
                            self._nextEvoNAME=nextEvo
                            if let uri=evolutions[0]["resource_uri"] as? String{
                                
                                let newStr=uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoID=newStr.replacingOccurrences(of: "/", with: "")
                                self._nextEvoID=nextEvoID
                                
                                if let nextLVLExist=evolutions[0]["level"]{
                                    
                                    if let lvl=nextLVLExist as? Int{
                                        
                                        self._nextEvoLVL="\(lvl)"
                                    }
                                    
                                }else{
                                    
                                    self._nextEvoLVL=""
                                }
                            }
                        }
                    }
                }
                
            }
            completed()
        }
        
    }
        
        
}
