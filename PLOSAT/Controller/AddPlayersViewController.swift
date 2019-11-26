//
//  AddPlayersViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class AddPlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addPlayer: DesignableButton!
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Model.instance.game.players.count  + 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        switch Model.instance.game.players.count {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addPlayerCell") as! AddPlayerTableViewCell

            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "jogadorCell") as! JogadoresTableViewCell

            return cell
        }
        
            
}


override func viewDidLoad() {
    super.viewDidLoad()
    tableview.keyboardDismissMode = .onDrag
    Model.instance.game  = Game(players: [])
    print( Model.instance.game.players.count)
    
    
    
}
    
    override func viewWillAppear(_ animated: Bool) {

    }


}
