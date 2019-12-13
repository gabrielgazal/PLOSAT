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
    var minJogadores = 4
    var enoughPlayers = 0
    var jogadorCondenado = 0
    var jogadorSelecionado = 0
    var somLigado = true
    var timerPensar = 90
    var timerContar = 90
    var timerDiscutir = 90
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
    
    private init (){
        
        personagem = ["Um gótico","Freiras idosas","Uma médica cega","Um anão policial", "Ken humano","Um aficionado em OVNIs"]
        lugar = ["Ilhas Maldivas","Uma sala de cinema abandonado","Um cassino clandestino","Uma loja de bonecas de porcelana","Um criadouro de rãs","A escola onde sua vó estudou"]
        objeto = ["Uma britadeira","Envelope com carimbo de CONFIDENCIAL","Vinho Bordeaux safra 1968","O primeiro óculos de Silvio Santos","Um balão de vôo"]
        situacao = ["Baile da terceira idade","Sequestro relâmpago","Ataque de zumbis","Festa de arromba","Briga por demora em um restaurante","Chuva de granizo"]
        acao = ["Fotografar pessoas","Entrar em um elevador com pessoas molhadas","Casar-se","Subir uma escadaria de joelhos","Matar uma aranha","Pintar um quadro"]
        tema = [Tema(titulo: "ASSALTO À JOALHERIA", descricao: "A joalheria Dvinit é conhecida por suas peças raras e de alto valor agregado. Na noite de ontem, três colares de diamante amarelo foram furtados. Boatos que alguém com experiência em alta tecnologia burlou o sistema de segurança da loja.\nTodos aqui visitaram à loja no dia de ontem. Qual o motivo de você ter ido à Joalheria Dvinit?"),
                Tema(titulo: "INVASÃO AO EMAIL DO PRESIDENTE", descricao: "Um grande escândalo envolvendo contatos do presidente foi destaque na mídia. Misteriosamente, todos aqui foram os últimos a escreverem ao presidente antes do ataque virtual. Explique o conteúdo da sua mensagem à vossa excelência e por que isso não tem relação com o hackeamento da sua conta."),
                Tema(titulo: "PICHAÇÃO NO TEATRO MUNICIPAL", descricao: "No palco do teatro, uma enorme pichação satirizava João Almeida, o diretor do teatro. Por terem todos aqui terem sidos os únicos na plateia a assistir à última sessão da noite anterior, realizada por um ator iniciante. Explique por que se interessou em ver a peça “O monólogo de um gago”."),
                Tema(titulo: "MUAMBA NA ALFÂNDEGA", descricao: "Na hora de atravessar a fronteira com o Paraguai, o policial da alfândega parou a van onde todos vocês estavam. Junto ao tanque de combustível, havia uma boneca toda recheada de pílulas verdes Autramax, uma droga nova e caríssima que está amplamente disputada pelo tráfico. Todos aqui tem de justificar ao oficial."),
                Tema(titulo: "ROUBO DE PROTÓTIPO", descricao: "Na Califórnia, os designers engenheiros da Apple trabalham para o lançamento próximo de um novo iPhone. Em um breve descuido na última terça-feira, o protótipo do mais novo aparelho foi furtado. Todos aqui tinham fortes interesses em ter os segredos desse lançamento. Qual é seu álibi para o dia do crime?")
        ]
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

