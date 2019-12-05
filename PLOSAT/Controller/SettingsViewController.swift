//
//  SettingsViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 04/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func dismissScreenButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func soundsCheck(_ sender: Any) {
    }
    @IBOutlet weak var pensarLabel: UILabel!
    @IBOutlet weak var contarLabel: UILabel!
    @IBOutlet weak var discutirLabel: UILabel!
    
    let model = Model.instance

    var timePensar = Model.instance.timerPensar
    var timeContar = Model.instance.timerContar
    var timeDiscutir = Model.instance.timerDiscutir
    
    @IBAction func minusPensar(_ sender: Any) {
        if timePensar > 30{
            timePensar -= 30
        }else{
            return
        }
        pensarLabel.text = converteString(count: timePensar)

    }
    @IBAction func plusPensar(_ sender: Any) {
        timePensar += 30
        pensarLabel.text = converteString(count: timePensar)

    }
    
    @IBAction func minusContar(_ sender: Any) {
        if timeContar > 30{
            timeContar -= 30
        }else{
            return
        }
        contarLabel.text = converteString(count: timeContar)

    }
    @IBAction func plusContar(_ sender: Any) {
        timeContar += 30
        contarLabel.text = converteString(count: timeContar)

    }
    @IBAction func minusDiscutir(_ sender: Any) {
        if timeDiscutir > 30{
            timeDiscutir -= 30
        }else{
            return
        }
        discutirLabel.text = converteString(count: timeDiscutir)

    }
    @IBAction func plusDiscutir(_ sender: Any) {
        timeDiscutir += 30
        discutirLabel.text = converteString(count: timeDiscutir)

    }
    
    @IBAction func save(_ sender: Any) {
        model.timerContar = timeContar
        model.timerDiscutir = timeDiscutir
        model.timerPensar = timePensar
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pensarLabel.text = converteString(count: Model.instance.timerPensar)
        contarLabel.text = converteString(count: Model.instance.timerContar)
        discutirLabel.text = converteString(count: Model.instance.timerDiscutir)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        pensarLabel.text = converteString(count: Model.instance.timerPensar)
        contarLabel.text = converteString(count: Model.instance.timerContar)
        discutirLabel.text = converteString(count: Model.instance.timerDiscutir)
        self.reloadInputViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        pensarLabel.text = converteString(count: Model.instance.timerPensar)
        contarLabel.text = converteString(count: Model.instance.timerContar)
        discutirLabel.text = converteString(count: Model.instance.timerDiscutir)
        self.reloadInputViews()
    }
    func converteString(count: Int) -> String{
        let minutos = count/60
        let segundos = count % 60
        
        let string = String(format: "%02d:%02d", minutos, segundos)
        
        return string
    }
    
}
