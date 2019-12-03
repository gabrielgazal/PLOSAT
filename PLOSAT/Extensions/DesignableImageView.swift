//
//  DwsignableImageView.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 02/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignableImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
            
        }
    }
   
    func updateLayerProperties() {
           self.layer.masksToBounds = false
       }
}
