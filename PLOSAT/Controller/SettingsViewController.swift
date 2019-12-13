//
//  SettingsViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 04/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: UIButton!
    @IBAction func dismissScreenButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func soundsCheck(_ sender: Any) {
        Model.instance.somLigado = !Model.instance.somLigado
        if Model.instance.somLigado{
            toggleButton.backgroundColor = #colorLiteral(red: 1, green: 0.5215686275, blue: 0.4980392157, alpha: 1)
            toggleButton.setImage(UIImage(named: "check"), for: .normal)
        }else{
            toggleButton.backgroundColor = . clear
//            toggleButton.
        }
    }
    @IBOutlet weak var pensarLabel: UILabel!
    @IBOutlet weak var contarLabel: UILabel!
    @IBOutlet weak var discutirLabel: UILabel!
    
    let model = Model.instance

    var timePensar = Model.instance.timerPensar
    var timeContar = Model.instance.timerContar
    var timeDiscutir = Model.instance.timerDiscutir
    
    @IBAction func minusPensar(_ sender: Any) {
        if (timePensar > 10){
            timePensar -= 10
        }else{
            return
        }
        pensarLabel.text = converteString(count: timePensar)

    }
    @IBAction func plusPensar(_ sender: Any) {
        if (timePensar < 300){
            timePensar += 10
        }else{
            return
        }
        
        pensarLabel.text = converteString(count: timePensar)

    }
    
    @IBAction func minusContar(_ sender: Any) {
        if timeContar > 10{
            timeContar -= 10
        }else{
            return
        }
        contarLabel.text = converteString(count: timeContar)

    }
    @IBAction func plusContar(_ sender: Any) {
        if (timeContar < 300){
            timeContar += 10
        }else{
            return
        }
        contarLabel.text = converteString(count: timeContar)

    }
    @IBAction func minusDiscutir(_ sender: Any) {
        if (timeDiscutir > 10){
            timeDiscutir -= 10
        }else{
            return
        }
        discutirLabel.text = converteString(count: timeDiscutir)

    }
    @IBAction func plusDiscutir(_ sender: Any) {
        
        if (timeDiscutir < 300){
            timeDiscutir += 10
        }else{
            return
        }
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
        
        let string = String(format: "%02d   :   %02d", minutos, segundos)
        
        return string
    }
    
}
