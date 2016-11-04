//
//  ViewController.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate
{

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var pokemon=[Pokemon]()
    var filteredPokemon=[Pokemon]()
    var musicPlayer:AVAudioPlayer!
    var inSearchMode=false
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource=self
        collection.delegate=self
        SearchBar.delegate=self
        //REMOVES THE RETURN KEY TYPE
        SearchBar.returnKeyType=UIReturnKeyType.done
      
        parsePokemonCSV()
        initAudio()
        
        
       }

    
    
    
    
    
    
    
    func initAudio(){
        
        let path=Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do{
            musicPlayer=try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
            
        } catch let err as NSError{
            
            print(err.debugDescription)
        }
        
    }
    
    
   
    
    
    
    
    
    
    
    
    
    func parsePokemonCSV(){
        let path=Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do{
            
            let csv=try CSV(contentsOfURL: path)
            let rows=csv.rows
            print(rows)
            
            for row in rows{
                
                let pokeid=Int(row["id"]!)!
                let name=row["identifier"]!
                
                let poke=Pokemon(Name: name, PokedexID: pokeid)
                pokemon.append(poke)
            }
            
            
        }catch let err as NSError{
            
            print(err.debugDescription)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let poke : Pokemon!
            
            
            if inSearchMode {
                
                poke=filteredPokemon[indexPath.row]
                cell.configureCell(poke)
                
            }else{
                poke = pokemon[indexPath.row]
                cell.configureCell(poke)
            }
            
            
            return cell
        
        }else{
            
            return UICollectionViewCell()
            
            
        }
    }
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var poke: Pokemon!

        if inSearchMode{
            
            
            poke=filteredPokemon[indexPath.row]
        }else{
            
            poke=pokemon[indexPath.row]
            print("FAIZEL: Index Row is \(indexPath.row)")
            
        }
        performSegue(withIdentifier: "PokemonDetailVC3", sender: poke)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        if inSearchMode{
            return filteredPokemon.count
        }else{
            return pokemon.count
        }
        
        }
    
    
    
    
    
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
        
    }
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying{
            musicPlayer.pause()
            sender.alpha = 0.2
        }else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    
    //REMOVES KEYBOARD
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if SearchBar.text==nil || SearchBar.text==""{
            
            inSearchMode=false
            collection.reloadData()
            //REMOVES KEYBOARD
            view.endEditing(true)
            
        }else{
            
            inSearchMode=true
            let lower = searchBar.text!.lowercased()
            filteredPokemon=pokemon.filter({$0.Name.range(of: lower) != nil})
                collection.reloadData()
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // you first need to see what "segue" is being used then check what object is "sender" before passing object to sent VC *****dont forget to create a container in the receiving VC to hold the sent object
        // in this case its the Pokemon object
        if segue.identifier == "PokemonDetailVC3" {
            if let detailVC=segue.destination as? PokemonDetailVC3{
                if let poke=sender as? Pokemon{
                    detailVC.pokemon=poke
                }
                
            }
            
        }
    }
    }
