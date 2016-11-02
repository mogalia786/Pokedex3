//
//  ViewController.swift
//  Pokedex3
//
//  Created by ebrahim on 11/2/16.
//  Copyright © 2016 iSTROBE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var collection: UICollectionView!
    var pokemon=[Pokemon]()
    var musicPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource=self
        collection.delegate=self
       parsePokemonCSV()
        initAudio()
        
        // Do any additional setup after loading the view, typically from a nib.
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
            let poke=pokemon[indexPath.row]
            cell.configureCell(poke)
            
            return cell
        }else{
            
            return UICollectionViewCell()
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
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
}

