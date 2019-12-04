//
//  Model.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 21/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

class Model{
    static let instance = Model()
    
    let publicDataBaase = CKContainer.default().publicCloudDatabase
    
    var personagem : [String]!
    var lugar : [String]!
    var objeto : [String]!
    var situacao : [String]!
    var acao : [String]!
    var tema : [Tema]!
    var lastGuilt = Int.random(in: 0 ... 1)
    var viuModal = false
    var timerUniversal = 90 {
        didSet {
            timeObservers.forEach( { $0.notify() } )
        }
    }
    
    func nextGuilty() {
        let njog = self.game.players.count
        let intervalo = CGFloat.pi * 0.5 / CGFloat(njog)
        let rand = CGFloat.random(in: 0 ..< 1)
        let indice = Int(asin(rand)/intervalo)
        
        let listaOrdenada = self.game.players.sorted(by: { $0.guiltyCount < $1.guiltyCount })
        let guiltyPLayer = listaOrdenada[indice]
        guiltyPLayer.guiltyCount += 1
      
        self.lastGuilt = indice
        listaOrdenada[indice].setGuilty()
    }
    
    var timeObservers = [TimeObserver]()
    var jogadorCondenado = 0
    
    private init (){
        
        personagem = ["Vizinho"]
        lugar = ["Boate LGBT"]
        objeto = ["Peruca Loira",]
        situacao = ["Sequestro relâmpago",]
        acao = ["Lavar um caixão",]
        tema = [Tema(titulo: "Roubo de Prototipo", descricao: "Na Califórnia, os designers engenheiros da Apple trabalham para o lançamento próximo de um novo iPhone. Em um breve descuido na última terça-feira, o protótipo do mais novo aparelho foi furtado. Todos aqui tinham fortes interesses em ter os segredos desse lançamento. Qual é seu álibi para o dia do crime?")]
        querys()
    }
    
    
    
    func querys(){
        personagemQuery()
        lugarQuery()
        objetoQuery()
        situacaoQuery()
        acaoQuery()
        temaQuery()

    }

    
    func personagemQuery(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Personagem", predicate: predicate)
        
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            
            for record in recs {
                self.personagem.append(record["personagem"]!)
            }
        }
        
    }
    
    func lugarQuery(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Lugar", predicate: predicate)
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            for record in recs {
                self.lugar.append(record["lugar"]!)
            }
        }
    }
    func objetoQuery(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "objeto", predicate: predicate)
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            for record in recs {
                self.objeto.append(record["objeto"]!)
            }
        }
    }
    func situacaoQuery(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "situacao", predicate: predicate)
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            for record in recs {
                self.situacao.append(record["situacao"]!)
            }
        }
    }
    func acaoQuery(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "acao", predicate: predicate)
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            for record in recs {
                self.acao.append(record["acao"]!)
            }
        }
    }
    func temaQuery(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "tema", predicate: predicate)
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            for record in recs {
                self.tema.append(Tema(titulo: record["titulo"]!, descricao: record["descricao"]!))
            }
        }
    }
    
    
    var enoughPlayers = 0
    var jogadorSelecionado = 0
    

    
    func shufle(){
        self.personagem.shuffle()
        self.lugar.shuffle()
        self.objeto.shuffle()
        self.situacao.shuffle()
        self.acao.shuffle()
        self.tema.shuffle()
    }
    
    var game: Game!
}

protocol TimeObserver {
    func notify()
}

