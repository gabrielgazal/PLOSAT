//
//  HintsViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 09/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit
import Foundation

class HintsViewController: UIViewController {
    
    @IBOutlet weak var TextView: UITextView!
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popToViewController((navigationController?.viewControllers[1])!, animated: true)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.attributedText = setup()
        
        
        
        
    }
    
    func setup() -> NSMutableAttributedString{
        
        let titulo1 = "Sou obrigado a usar todos os elementos PLOSAT que recebi? "
        let subtitulo1 = "\nO uso é livre, mas lembre-se: outros jogadores podem ter recebido elementos iguais aos seus, por isso usar tudo que você recebeu na sua história reforçará sua inocência."
        
        
        let titulo2 = "\n\n\nComo usar os personagens? "
        let subtitulo2 = "\nO uso é livre. Pode ser um mero coadjuvante no contexto como pode assumir protagonismo. Se preferir, você pode fingir ser aquele personagem no momento. Explore a criatividade e seja o mais convincente possível."
        
        
        let titulo3 = "\n\n\nComo posso criar uma história convincente sendo culpado? "
        let subtitulo3 = "\nÉ justamente a oportunidade mais interessante para exercitar a criatividade. Pensar em objetos estranhos, personagens inesperados e situações diferentes das que você está acostumado convencerá os demais jogadores que você de fato recebeu elementos PLOSAT do jogo.\nSe você não for o primeiro jogador sorteado, pode se apropriar de elementos de outros jogadores para sugerir que também recebeu aquelas dicas."
        
        let stringFinal = NSMutableAttributedString()
        
        let titleFont = "RobotoCondensed-Bold"
        let textFont = "RobotoCondensed-Regular"
        
        let titleColor = #colorLiteral(red: 0.9960784314, green: 0.7921568627, blue: 0.4235294118, alpha: 1)
        let textcolot = #colorLiteral(red: 0.8980392157, green: 0.8235294118, blue: 0.7647058824, alpha: 1)
        
        let titulo01 = NSAttributedString(string: titulo1.uppercased(), attributes: [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: UIFont(name: titleFont, size: 18.0) as Any])
        let titulo02 = NSAttributedString(string: titulo2.uppercased(), attributes: [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: UIFont(name: titleFont, size: 18.0) as Any])
        let titulo03 = NSAttributedString(string: titulo3.uppercased(), attributes: [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: UIFont(name: titleFont, size: 18.0) as Any])
        
        let subtitulo01 = NSAttributedString(string: subtitulo1, attributes: [
            NSAttributedString.Key.foregroundColor: textcolot,
            NSAttributedString.Key.font: UIFont(name: textFont, size: 18.0) as Any])
        let subtitulo02 = NSAttributedString(string: subtitulo2, attributes: [
            NSAttributedString.Key.foregroundColor: textcolot,
            NSAttributedString.Key.font: UIFont(name: textFont, size: 18.0) as Any])
        let subtitulo03 = NSAttributedString(string: subtitulo3, attributes: [
            NSAttributedString.Key.foregroundColor: textcolot,
            NSAttributedString.Key.font: UIFont(name: textFont, size: 18.0) as Any])
        
        stringFinal.append(titulo01)
        stringFinal.append(subtitulo01)
        
        stringFinal.append(titulo02)
        stringFinal.append(subtitulo02)
        
        stringFinal.append(titulo03)
        stringFinal.append(subtitulo03)
  
        return stringFinal
        
    }
    //    func setupView() {
    //
    //        let view = UITextView()
    //
    //        let result = NSMutableAttributedString()
    //        let tri = NSAttributedString(string:"TRI",
    //                                     attributes: [
    //                                        NSAttributedString.Key.foregroundColor: UIColor.red,
    //                                        NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 18.0) as Any])
    //
    //        let canvas = NSAttributedString(string:"CANVAS",
    //                                        attributes:[
    //                                            NSAttributedString.Key.foregroundColor: UIColor.blue,
    //                                            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Light", size: 18.0) as Any])
    //        result.append(tri)
    //        result.append(canvas)
    //        view.attributedText = result
    //
    //        self.navigationItem.titleView = view
    //    }
    
}
