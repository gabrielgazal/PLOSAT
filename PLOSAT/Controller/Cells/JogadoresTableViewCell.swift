//
//  JogadoresTableViewCell.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class JogadoresTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var RemoveButotn: UIButton!
    @IBOutlet weak var seloImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        seloImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        playerImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
