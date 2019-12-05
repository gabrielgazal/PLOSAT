//
//  DiscussionTimerViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class DiscussionTimerViewController: UIViewController {
    
    @IBOutlet weak var minutosLabel: UILabel!
    @IBOutlet weak var segundosLabel: UILabel!
    var createdTimer = false
    @IBAction func StartTimer(_ sender: Any) {
        if createdTimer{
            return
        }
        createdTimer = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    @IBAction func startVoting(_ sender: Any) {
        
        AudioManager.shared.stopCurrentSong()
        AudioManager.shared.play(soundEffect: .button)
        if timer != nil {
            timer.invalidate()
            performSegue(withIdentifier: "startVoting", sender: nil)
        } else{
            performSegue(withIdentifier: "startVoting", sender: nil)
            
        }
        
    }
    var timer: Timer!
    var count = Model.instance.timerDiscutir{
        didSet {
            let minutos = count/60
            let segundos = count % 60
            
            minutosLabel.text = String(format: "%02d",minutos)
            segundosLabel.text = String(format: "%02d",segundos)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tempo = Model.instance.timerDiscutir
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
    
    @IBAction func AudioManagersharedplaysoundEffectbuttonnext(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)

    }
}
