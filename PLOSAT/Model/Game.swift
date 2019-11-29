//
//  Game.swift
//  PLOSAT
//
//  Created by Walace Pereira on 22/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation
import UIKit

class Game {
    
    var players: [Player]!
    var plosat: Plosat!
    var tema: Tema!
    internal init(players: [Player]) {
        Model.instance.shufle()
        self.players = players
        self.plosat = Plosat(personagem: Model.instance.personagem.randomElement()!, lugar: Model.instance.lugar.randomElement()!, objeto: Model.instance.objeto.randomElement()!, situacao: Model.instance.situacao.randomElement()!, acao: Model.instance.acao.randomElement()!)
        self.tema = Model.instance.tema.randomElement()

    }
    
    func newPlayer(name: String,  foto: UIImage){
        let newPlosat = Plosat.init(personagem: "", lugar: "", objeto: "", situacao:  "", acao: "")
        let n = Int.random(in: 0 ... 4)
        var g = Int.random(in: 0 ... 4)
        
        while (n == g){
             g = Int.random(in: 0 ... 4)
        }
        print(self.plosat.card[n])
        newPlosat.card[n] = [self.plosat.card[n][Int.random(in: 0...0)]]
        print(self.plosat.card[g])
        newPlosat.card[g] = [self.plosat.card[g][Int.random(in: 0...0)]]
        
        let newPlayer = Player(name: name, plosat: newPlosat, foto: foto, culpado: false, visoes: 0)
        players.append(newPlayer)
    }
    func declareGuilty(){
        let playerCount = Model.instance.game.players.count-1
        Model.instance.game.players[Int.random(in: 0 ... playerCount)].setGuilty()
    }
}
