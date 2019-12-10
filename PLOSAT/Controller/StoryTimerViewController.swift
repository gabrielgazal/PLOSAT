//
//  StoryTimerViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class StoryTimerViewController: UIViewController {
    
    
    
    @IBOutlet weak var timerCounter: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var espiearAlibi: DesignableButton!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nextPLayerLabel: UILabel!
    @IBOutlet weak var nextPage: DesignableButton!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var seloImage: UIImageView!
    var createdTimer = false
    var timer : Timer!
    var endGame: Bool = false
    
    
    @IBAction func espiarAlibi(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        if let vc = storyboard?.instantiateViewController(identifier: "vcDetalhe") as? PapeisViewController {
            vc.player = currentPlayer
            DispatchQueue.main.async {
                self.present(vc, animated: true)
            }
        }
        
    }
    @IBAction func nextScreen(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        performSegue(withIdentifier: "startDebate", sender: nil)
    }
    
    @IBAction func resetScreen(_ sender: Any) {
    }
    @IBAction func startTempo(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)

        if createdTimer{
            return
        }
        createdTimer = true
        guard !endGame else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    var count = Model.instance.timerContar {
        didSet {
            let minutos = count/60
            let segundos = count % 60
            
            timerCounter.text = String(format: "%02d",minutos)
            secondsLabel.text = String(format: "%02d",segundos)
//            createdTimer = false
        }
    }
    
    var ordenacao: [Player] = []
    var currentPlayer : Player?
    
    
    
    fileprivate func round() {
        #if DEBUG
        
        #else
        
        #endif
            if ordenacao.count > 0 {
                currentPlayer = ordenacao.remove(at: 0)
                playerImage.image = currentPlayer?.foto
                seloImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
                playerImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
                
                let nome = currentPlayer!.name.uppercased()
                createdTimer = false
                let contentString = "\(nome),\nDEFENDA-SE"
                
                nomeLabel.text? = contentString
            }
            
            if let next = ordenacao.first {
                nextPLayerLabel.isHidden = true
//                nextPLayerLabel.text = "\(next.name)"
            } else {
                nextPLayerLabel.isHidden = true
                //Mostra botao de continuar
                //Esconde ver alibi
                //Escon
                //Fim da rodada
            }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.viuModal = false
        let tempo = Model.instance.timerContar
        let minutos = tempo/60
        let segundos = tempo % 60
        
        timerCounter.text = String(format: "%02d",minutos)
        secondsLabel.text = String(format: "%02d",segundos)
        nextPage.isHidden = true
        ordenacao = Model.instance.game.players
        ordenacao.shuffle()
        
        round()
        
        count = Model.instance.timerContar
        Model.instance.timerUniversal = count
    }
    
    @objc func update(){
        if (count > 0){
            count -= 1
            Model.instance.timerUniversal = count
        } else {
            count = Model.instance.timerContar
            Model.instance.timerUniversal = count

            timer.invalidate()
            if ordenacao.count > 0 {
                round()
            } else {
                espiearAlibi.isHidden = true
                nextPage.isHidden = false
                nextPLayerLabel.isHidden = false
                endGame = true
            }
        }
        if(Model.instance.timerUniversal == 10){
            AudioManager.shared.play(soundEffect: .timer)
        }
    }
    

    
    
}
