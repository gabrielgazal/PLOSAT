//
//  PrepareViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 29/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class PrepareViewController: UIViewController {
    
    @IBOutlet weak var minutosLabel: UILabel!
    @IBOutlet weak var segundosLabel: UILabel!
    var createdTimer = false
    
    @IBAction func StartTimer(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        if createdTimer{
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        createdTimer = true
        
    }
    var timer: Timer!
    var count = Model.instance.timerPensar{
        didSet {
            let minutos = count/60
            let segundos = count % 60
            
            minutosLabel.text = String(format: "%02d",minutos)
            segundosLabel.text = String(format: "%02d",segundos)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tempo = Model.instance.timerPensar
        let minutos = tempo/60
        let segundos = tempo % 60
        
        minutosLabel.text = String(format: "%02d",minutos)
        segundosLabel.text = String(format: "%02d",segundos)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func update() {
        if(count > 0) {
            count -= 1
        }else {

            timer.invalidate()
            if Model.instance.viuModal == false{
                self.performSegue(withIdentifier: "modalDiscussion", sender: nil)
            }
        }
        if(count == 10){
            AudioManager.shared.play(soundEffect: .timer)
        }
    }
    
    func goToStoryTimer () {
        self.performSegue(withIdentifier: "nextOne", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MODALViewController {
            destination.presentationParent = self
        }
        
    }
    
    //    performSegue(withIdentifier: "nextOne", sender: nil)
    
    
    
}
