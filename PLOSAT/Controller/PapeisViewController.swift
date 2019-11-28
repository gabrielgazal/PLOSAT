//
//  PapeisViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 28/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class PapeisViewController: UIViewController {
    
    @IBAction func DismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var NomeJogador: UILabel!
    
    @IBOutlet weak var personagemLabel: UILabel!
    @IBOutlet weak var LugarLabel: UILabel!
    @IBOutlet weak var ObjetoLabel: UILabel!
    @IBOutlet weak var SituacaoLabel: UILabel!
    @IBOutlet weak var AcaoLabel: UILabel!
    
    @IBOutlet weak var inocCulpImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NomeJogador.text = Model.instance.game.players[Model.instance.jogadorSelecionado].name
        
        personagemLabel.attributedText = formatLabel(title: "PERSONAGEM(S)", subtitle: "\(Model.instance.game.players[Model.instance.jogadorSelecionado].plosat.card[1][0])")
        LugarLabel.attributedText = formatLabel(title: "LUGAR(S)", subtitle: "\(Model.instance.game.players[Model.instance.jogadorSelecionado].plosat.card[2][0])")
        ObjetoLabel.attributedText = formatLabel(title: "OBJETOS(S)", subtitle: "\(Model.instance.game.players[Model.instance.jogadorSelecionado].plosat.card[3][0])")
        SituacaoLabel.attributedText = formatLabel(title: "SITUAÇÃO", subtitle: "\(Model.instance.game.players[Model.instance.jogadorSelecionado].plosat.card[4][0])")
        AcaoLabel.attributedText = formatLabel(title: "AÇÃO", subtitle: "\(Model.instance.game.players[Model.instance.jogadorSelecionado].plosat.card[5][0])")
        
        if Model.instance.game.players[Model.instance.jogadorSelecionado].culpado{
            inocCulpImage.image = UIImage(named: "culpado")
        } else{
            inocCulpImage.image = UIImage(named: "inocente")

        }
        
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
