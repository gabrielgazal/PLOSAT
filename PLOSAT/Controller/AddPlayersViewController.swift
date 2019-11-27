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
    
   
    @IBOutlet weak var StartGame: DesignableButton!
    
    @IBAction func StartPLaying(_ sender: Any) {
        if Model.instance.enoughPlayers{
            performSegue(withIdentifier: "startGame", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Model.instance.game.players.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "jogadorCell") as! JogadoresTableViewCell
            cell.playerImage.image = Model.instance.game.players[indexPath.row].foto
            cell.playerName.text = Model.instance.game.players[indexPath.row].name
            return cell
        
    }
    


override func viewDidLoad() {
    super.viewDidLoad()
    tableview.keyboardDismissMode = .onDrag
    Model.instance.game  = Game(players: [])
    addPlayer.titleLabel?.font = UIFont(name: "RobotoCondensed-Bold", size: 20)

    NotificationCenter.default.addObserver(self, selector: #selector(performUpdate), name: NSNotification.Name("atualizaJogadores"), object: nil)
  
}
    
    @objc func performUpdate(_ notification: Notification){
        self.tableview.reloadData()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
    }


}
