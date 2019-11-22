//
//  Jogador.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 22/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation
import UIKit

class Jogador{
    internal init(nome: String, culpado: Bool, categorias: plosatClass) {
        self.nome = nome
        self.culpado = culpado
        self.categorias = categorias
    }
    
    var nome: String
    var culpado: Bool
    var categorias: plosatClass
    
}
