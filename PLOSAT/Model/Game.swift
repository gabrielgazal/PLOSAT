//
//  Game.swift
//  PLOSAT
//
//  Created by Walace Pereira on 22/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation

class Game {
    
    var players: [Player]!
    var plosat: Plosat!
    
    internal init(players: [Player]) {
        Model.instance.shufle()
        self.players = players
        self.plosat = Plosat(personagem: Model.instance.personagem.randomElement()!, lugar: Model.instance.lugar.randomElement()!, objeto: Model.instance.objeto.randomElement()!, situacao: Model.instance.situacao.randomElement()!, acao: Model.instance.acao.randomElement()!, tema: Model.instance.tema.randomElement()!)
        
        //Ajeitar para adicionar infos extras \/
        self.plosat.card[1].append("personagem")
        self.plosat.card[2].append("lugar")
        self.plosat.card[3].append("objeto")
        self.plosat.card[4].append("situacao")
        self.plosat.card[5].append("acao")


    }
    
    func newPlayer(name: String){
        let newPlosat = Plosat.init(personagem: "", lugar: "", objeto: "", situacao:  "", acao: "", tema: "")
        let n = Int.random(in: 1 ... 5)
        newPlosat.card[n] = [self.plosat.card[n][Int.random(in: 0...1)]]
        let newPlayer = Player(name: name, plosat: plosat)
        players.append(newPlayer)
    }
}
