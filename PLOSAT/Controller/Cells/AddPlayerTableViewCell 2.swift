//
//  AddPlayerTableViewCell.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class AddPlayerTableViewCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet weak var NewPlayerField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewPlayerField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
