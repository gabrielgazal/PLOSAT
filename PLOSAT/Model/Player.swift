//
//  Jogador.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 22/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation
import UIKit

class Player{
    
    var name: String
    var plosat: Plosat
    var foto: UIImage
    var culpado = false
    var visoes = 0
    
    internal init(name: String, plosat:Plosat, foto: UIImage, culpado: Bool, visoes: Int) {
        self.name = name
        self.plosat = plosat
        self.foto = foto
        self.culpado = culpado
        self.visoes = visoes
    }

    
}
