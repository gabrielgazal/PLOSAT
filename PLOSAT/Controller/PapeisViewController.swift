//
//  PapeisViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 28/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class PapeisViewController: UIViewController, TimeObserver {
    func notify() {
        let minutos = Model.instance.timerUniversal/60
        let segundos = Model.instance.timerUniversal % 60
        timerLabel.text = String(format: "%02d:%02d",minutos,segundos)
        if Model.instance.timerUniversal == 0{
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func DismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var NomeJogador: UILabel!
    
    @IBOutlet weak var personagemLabel: UILabel!
    @IBOutlet weak var LugarLabel: UILabel!
    @IBOutlet weak var ObjetoLabel: UILabel!
    @IBOutlet weak var SituacaoLabel: UILabel!
    @IBOutlet weak var AcaoLabel: UILabel!
    @IBOutlet weak var timerView: DesignableView!
    @IBOutlet weak var timerIcon: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var inocCulpImage: UIImageView!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.timeObservers.append(self)////
        
        if let player = player {
            NomeJogador.text = player.name.uppercased()
            personagemLabel.attributedText = formatLabel(title: "PERSONAGEM(S)", subtitle: "\(player.plosat.card[0][0])")
            LugarLabel.attributedText = formatLabel(title: "LUGAR(S)", subtitle: "\(player.plosat.card[1][0])")
            ObjetoLabel.attributedText = formatLabel(title: "OBJETOS(S)", subtitle: "\(player.plosat.card[2][0])")
            SituacaoLabel.attributedText = formatLabel(title: "SITUAÇÃO", subtitle: "\(player.plosat.card[3][0])")
            AcaoLabel.attributedText = formatLabel(title: "AÇÃO", subtitle: "\(player.plosat.card[4][0])")
            
            if player.culpado {
                inocCulpImage.image = UIImage(named: "culpado")
                personagemLabel.attributedText = formatLabel(title: "PERSONAGEM(S)", subtitle: "")
                LugarLabel.attributedText = formatLabel(title: "LUGAR(S)", subtitle: "")
                ObjetoLabel.attributedText = formatLabel(title: "OBJETOS(S)", subtitle: "")
                SituacaoLabel.attributedText = formatLabel(title: "SITUAÇÃO", subtitle: "")
                AcaoLabel.attributedText = formatLabel(title: "AÇÃO", subtitle: "")
            } else{
                inocCulpImage.image = UIImage(named: "inocente")
                
            }
        }
        if Model.instance.viuModal{
            let minutos = Model.instance.timerUniversal/60
            let segundos = Model.instance.timerUniversal % 60
            
            timerLabel.text = String(format: "%02d:%02d",minutos,segundos)
        } else{
            timerView.isHidden = true
        }
        
    }
    
    @IBAction func exit(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
    }
    
    
    
    func formatLabel(title: String, subtitle: String) -> NSMutableAttributedString {
        let mutable = NSMutableAttributedString()
        let p1 = NSMutableAttributedString(string: title + ": ", attributes: [.font : UIFont(name: "RobotoCondensed-Bold", size: 20)!])
        let p2 = NSMutableAttributedString(string: subtitle, attributes: [.font : UIFont(name: "RobotoCondensed-Regular", size: 20)!])
        mutable.append(p1)
        mutable.append(p2)
        return mutable
    }
    
}
