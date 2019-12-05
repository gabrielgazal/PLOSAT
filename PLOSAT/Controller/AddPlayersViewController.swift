//
//  AddPlayersViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 25/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

class AddPlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExcluirJogador {
    
    func delete(at: IndexPath) {
        Model.instance.game.players.remove(at: at.section)
        tableview.reloadData()
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addPlayer: DesignableButton!
    
   
    @IBOutlet weak var StartGame: DesignableButton!
    
    @IBAction func StartPLaying(_ sender: Any) {
        if Model.instance.enoughPlayers >= 4{
            performSegue(withIdentifier: "startGame", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Model.instance.game.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jogadorCell") as! JogadoresTableViewCell
        cell.playerImage.image = Model.instance.game.players[indexPath.section].foto
        cell.playerName.text = Model.instance.game.players[indexPath.section].name
        cell.backgroundColor = .clear
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear

    }
   
    


override func viewDidLoad() {
    super.viewDidLoad()
    tableview.keyboardDismissMode = .onDrag
    Model.instance.game = Game(players: [])
    print(Model.instance.game.players.count)
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
