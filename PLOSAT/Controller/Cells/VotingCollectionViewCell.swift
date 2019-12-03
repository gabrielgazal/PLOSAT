//
//  VotingCollectionViewCell.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 02/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class VotingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var background: DesignableView!
    @IBOutlet weak var fotoJogador: UIImageView!
    @IBOutlet weak var seloImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seloImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        fotoJogador.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        // Initialization code
    }
    
}
