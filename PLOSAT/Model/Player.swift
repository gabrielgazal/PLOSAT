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
        let g = Int.random(in: 1 ... 5)
        var h = Int.random(in: 1 ... 5)
        while(g==h){
            h = Int.random(in: 1 ... 5)
        }
        for pos in 1 ... 5{
            if(pos != g && pos != h){
                self.plosat.card[pos] = [""]
            }
        }
        self.foto = foto
    }

    
}
