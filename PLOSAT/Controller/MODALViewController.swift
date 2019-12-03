//
//  MODALViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 29/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class MODALViewController: UIViewController {

    var presentationParent: PrepareViewController!
    @IBOutlet weak var nextScreen: DesignableButton!
    
    @IBAction func trocaDeTela(_ sender: Any) {
        Model.instance.viuModal  = true
        dismiss(animated: true) {
            self.presentationParent.goToStoryTimer()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

}
