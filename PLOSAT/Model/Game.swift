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
        self.players = players
    }
    
    func newPlayer(name: String,  foto: UIImage){
        let newPlosat = Plosat.init(personagem: "", lugar: "", objeto: "", situacao:  "", acao: "")
        let newPlayer = Player(name: name, plosat: newPlosat, foto: foto, culpado: false, visoes: 0)
        players.append(newPlayer)
    }
    func declareGuilty(){
//        let playerCount = Model.instance.game.players.count-1
        for player in self.players{
            player.culpado = false
        }
//        var p = Int.random(in: 0 ... playerCount)
//        if(p == Model.instance.lastGuilt){
//            p = Int.random(in: 0 ... playerCount)
//        }
//        Model.instance.game.players[p].setGuilty()
//        Model.instance.lastGuilt = p
        Model.instance.nextGuilty()
        
    }
}
