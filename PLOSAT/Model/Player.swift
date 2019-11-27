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
    
    internal init(name: String, plosat:Plosat, foto: UIImage) {
        self.name = name
        self.plosat = plosat
        self.foto = foto
    }

    
}
