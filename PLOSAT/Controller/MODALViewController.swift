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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
