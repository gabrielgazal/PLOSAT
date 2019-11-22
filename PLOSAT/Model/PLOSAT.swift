//
//  PLOSAT.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 21/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation

class plosatClass {
    internal init(personagem: String, lugar: String, objeto: String, situacao: String, acao: String, tema: String) {
        self.personagem = personagem
        self.lugar = lugar
        self.objeto = objeto
        self.situacao = situacao
        self.acao = acao
        self.tema = tema
    }
    
    
    var personagem: String
    var lugar: String
    var objeto: String
    var situacao: String
    var acao: String
    var tema: String
}
