//
//  ViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 21/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        Model.instance.enoughPlayers = 0
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        Model.instance.enoughPlayers = 0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        Model.instance.enoughPlayers = 0
        
    }
    
    @IBAction func Comecar(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
    }
    @IBAction func howTo(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        
    }
    @IBAction func config(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        
    }
}

