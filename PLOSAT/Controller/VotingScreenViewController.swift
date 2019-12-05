//
//  VotingScreenViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit
import Foundation

class VotingScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedPlayer = 0
    @IBOutlet weak var playerName: UILabel!
    @IBAction func CondenarJogador(_ sender: Any) {
        
//        Model.instance.jogadorCondenado = selectedPlayer
        performSegue(withIdentifier: "julgamento", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Model.instance.game.players.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "VoteCell", for: indexPath) as! VotingCollectionViewCell
        
        if Model.instance.jogadorCondenado != indexPath.row{
            cell.background.backgroundColor = .clear
        } else{
            cell.background.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.1333333333, blue: 0.2274509804, alpha: 1)
        }
        cell.fotoJogador.image = Model.instance.game.players[indexPath.row].foto
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionVotes.frame.width / 3.0)
        let height = (collectionVotes.frame.height / 3.0)
        
        
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Model.instance.jogadorCondenado = indexPath.row
        print( Model.instance.jogadorCondenado)
        collectionVotes.reloadData()
        playerName.text = Model.instance.game.players[Model.instance.jogadorCondenado].name
        AudioManager.shared.play(soundEffect: .button)

    }
    
    
    @IBOutlet weak var collectionVotes: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionVotes.delegate = self
        self.collectionVotes.dataSource = self
        playerName.text = Model.instance.game.players[Model.instance.jogadorCondenado].name
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        playerName.text = Model.instance.game.players[Model.instance.jogadorCondenado].name
        
    }
    override func viewDidAppear(_ animated: Bool) {
        playerName.text = Model.instance.game.players[Model.instance.jogadorCondenado].name
        
    }
    
    
    
}
