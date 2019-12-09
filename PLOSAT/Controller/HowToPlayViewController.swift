//
//  HowToPlayViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 04/12/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "tutorial", for: indexPath) as! TutorialCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.imagem.image = UIImage(named: "MINI01")
            cell.titulo.text = "SEJA CRIATIVO"
            cell.descricao.text = "Uma pequena história de crime é introduzida aos jogadores e todos na roda são suspeitos, mas apenas um realmente será o culpado."
            return cell
        case 1:
            cell.imagem.image = UIImage(named: "timer")
            cell.titulo.text = "DE OLHO NO TIMER"
            cell.descricao.text = "Todos os jogadores terão um tempo para elaborar sua história de defesa. Na sequência, cada um poderá contar sua história na ordem em que o app solicitar sua defesa."
            return cell

        case 2:
            cell.imagem.image = UIImage(named: "mini02")
            cell.titulo.text = "TROCA DE ACUSAÇÕES"
            cell.descricao.text = "Após a defesa de todos, é aberta na roda um timer com 3 minutos para discussão e troca de acusações."
            return cell

        case 3:
            cell.imagem.image = UIImage(named: "mini03")
            cell.titulo.text = "CONDENAÇÃO"
            cell.descricao.text = "Após a defesa de todos, é aberta na roda um timer com 3 minutos para discussão e troca de acusações."
            return cell

            
        default:
            cell.imagem.image = UIImage(named: "mini03")
            cell.titulo.text = "CONDENAÇÃO"
            cell.descricao.text = "Após a defesa de todos, é aberta na roda um timer com 3 minutos para discussão e troca de acusações."
            return cell

        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popToViewController((navigationController?.viewControllers[0])!, animated: true)
        
    }
    @IBAction func pageControl(_ sender: Any) {
    }
    @IBOutlet weak var passosCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passosCollection.delegate = self
        passosCollection.dataSource = self
        
        
    }
    
    
}
