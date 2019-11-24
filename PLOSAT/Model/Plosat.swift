//
//  PLOSAT.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 21/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation

class Plosat{
    

    var card = [[""]]
    
    internal init(personagem: String, lugar: String, objeto: String, situacao: String, acao: String, tema: String) {
        
        self.card.append([personagem])
        self.card.append([lugar])
        self.card.append([objeto])
        self.card.append([situacao])
        self.card.append([acao])
        self.card.append([tema])
        
    }

}
