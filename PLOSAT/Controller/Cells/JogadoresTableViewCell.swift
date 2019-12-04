//
//  JogadoresTableViewCell.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

protocol ExcluirJogador: class {
    func delete(at: IndexPath)
}

class JogadoresTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var RemoveButotn: UIButton!
    @IBOutlet weak var seloImage: UIImageView!
    
    var index: IndexPath!
    
    weak var delegate: ExcluirJogador?

    override func awakeFromNib() {
        super.awakeFromNib()
        seloImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        playerImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        
        RemoveButotn.addTarget(self, action: #selector(handleDelete), for: .touchUpInside)
    }
    
    @objc func handleDelete() {
        delegate?.delete(at: index)
        Model.instance.enoughPlayers -= 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
