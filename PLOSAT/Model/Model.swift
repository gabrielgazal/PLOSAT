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
    var viuModal = false
    var timerUniversal = 90 {
        didSet {
            timeObservers.forEach( { $0.notify() } )
        }
    }
    
    var timeObservers = [TimeObserver]()
    
    private init (){
        
        personagem = ["Cabral","Adonay","Pedro","Tiririca","ET Bilu"]
        lugar = ["Boate LGBT","Cassino clandestino","Deserto do Saara"]
        objeto = ["Peruca Loira","Gravação VHS","Dentadura com dente de ouro","Selo da copa de 1970"]
        situacao = ["Sequestro relâmpago","Ataque alienígena","Briga com facas","Show da Billie Eillish"]
        acao = ["Rasgar cartas","Lavar um caixão","Roer um cadeado"]
        tema = [Tema(titulo: "Descoberta do amor", descricao: "aadasfdasfdsgfdsafgadgfagadgd"),Tema(titulo: "Roubo do protótipo", descricao: "aadasfdasfdsgfdsafgadgfagadgd"),Tema(titulo: "Envenenamento do presidente", descricao: "aadasfdasfdsgfdsafgadgfagadgd")]
       // querys()
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
        var predicate = NSPredicate(format: "")
        predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "personagem", predicate: predicate)
        publicDataBaase.perform(query, inZoneWith: nil){ (records, error) in
            guard let recs = records else{
                print(error!.localizedDescription)
                return
            }
            for record in recs {
                self.personagem.append(record["personagem"]!)
                print(record["personagem"]!)
            }
        }
    }
    func lugarQuery(){
        var predicate = NSPredicate(format: "")
        predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "lugar", predicate: predicate)
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
        var predicate = NSPredicate(format: "")
        predicate = NSPredicate(value: true)
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
        var predicate = NSPredicate(format: "")
        predicate = NSPredicate(value: true)
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
        var predicate = NSPredicate(format: "")
        predicate = NSPredicate(value: true)
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
        var predicate = NSPredicate(format: "")
        predicate = NSPredicate(value: true)
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
    
    
    var enoughPlayers = false
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
