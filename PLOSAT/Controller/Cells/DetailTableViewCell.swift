//
//  DetailTableViewCell.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 27/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
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
