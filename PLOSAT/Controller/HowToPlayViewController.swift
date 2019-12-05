//
//  HowToPlayViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 04/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popToViewController((navigationController?.viewControllers[0])!, animated: true)

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
