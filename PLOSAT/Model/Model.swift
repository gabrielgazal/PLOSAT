//
//  Model.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 21/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation

class Model{
    static let instance = Model()
    
    var personagem : [String]!
    var lugar : [String]!
    var objeto : [String]!
    var situacao : [String]!
    var acao : [String]!
    var tema : [String]!
    
    private init (){
        
        personagem = ["Cabral","Walace","Gazal","Mari","Rodrigo"]
        lugar = ["Boate LGBT","Cassino clandestino","Deserto do Saara"]
        objeto = ["Peruca Loira","Gravação VHS","Dentadura com dente de ouro","Selo da copa de 1970"]
        situacao = ["Sequestro relâmpago","Ataque alienígena","Briga com facas","Show da Billie Eillish"]
        acao = ["Rasgar cartas","Lavar um caixão","Roer um cadeado"]
        tema = ["Descoberta do amor","Roubo do protótipo","Envenenamento do presidente"]
    }
    

    
    func shufle(){
        self.personagem.shuffle()
        self.lugar.shuffle()
        self.objeto.shuffle()
        self.situacao.shuffle()
        self.acao.shuffle()
        self.tema.shuffle()
    }
    
    var game: Game!
}
