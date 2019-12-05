//
//  ResultsViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var selo: UIImageView!
    @IBOutlet weak var fotoJogador: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstDesc: UILabel!
    @IBOutlet weak var secondDesc: UILabel!
    @IBOutlet weak var restart: DesignableButton!
    
    @IBAction func resetGame(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        navigationController?.popToViewController((navigationController?.viewControllers[1])!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selo.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        fotoJogador.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        fotoJogador.image = Model.instance.game.players[Model.instance.jogadorCondenado].foto
        let nome = Model.instance.game.players[Model.instance.jogadorCondenado].name.uppercased()
        resultLabel.text = "\(nome), VOCÊ FOI CONDENADX"
        let jogadorFinal = Model.instance.game.players[Model.instance.jogadorCondenado]
               if jogadorFinal.culpado{
                   firstDesc.text = "Parabéns jogadores, vocês prenderam o verdadeiro culpado."
                   secondDesc.text = "\(jogadorFinal.name), sua história não foi  convincente o suficiente."
                AudioManager.shared.play(soundEffect: .jail)
               }
               else{
                   firstDesc.text = "Mais um inocente foi preso, enquanto o verdadeiro assassino continua à solta."
                   secondDesc.text = "Jogadores, vocês fracassaram."
                AudioManager.shared.play(soundEffect: .jail)

               }
        
    }
   
    


}
