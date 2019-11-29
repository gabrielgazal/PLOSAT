//
//  StoryViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var imagemHistoria: UIImageView!
    @IBOutlet weak var HistoriaTitulo: UILabel!
    @IBOutlet weak var HistoriaDescricao: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HistoriaTitulo.text = Model.instance.game.tema.titulo
        HistoriaDescricao.text = Model.instance.game.tema.descricao
//        Model.instance.game.declareGuilty()
        // Do any additional setup after loading the view.
    }
   
    
}
