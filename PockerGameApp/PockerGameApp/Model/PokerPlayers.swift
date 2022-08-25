//
//  PokerPlayers.swift
//  PockerGameApp
//
//  Created by Jason on 2022/08/25.
//

import Foundation

class PokerPlayers {
    
    private var players = [Participant]()
    
    var count: PokerPlayers.Count {
        PokerPlayers.Count.allCases[players.count - 1]
    }
    
    var names: [String] {
        players.map{ $0.name }
    }
}

//MARK: - Card
extension PokerPlayers {
    private func addCard(at index: Int, card: Card) {
        players[index].add(card: card)
    }
    
    func removeAllCard() {
        players.forEach{ $0.removeAllCard() }
    }
}

//MARK: - Participant
extension PokerPlayers {
    func addPlayers(players: [Participant]) {
        players.forEach{ addPlayer(player: $0)
        }
    }
    
    func addPlayer(player: Participant) {
        self.players.append(player)
    }
    
    func removeAllPlayer() {
        self.players.removeAll()
    }
    
    func cardDistribution(dealer: Dealer, pokerStud: PokerGame.Stud,
                          addEventHandler: @escaping (Int, Int, Card) -> Void,
                          finishEventHandler: @escaping () -> Void) {
        // 작성 필요
    }
    
    func getWinner() -> String? {
        // 작성 필요
        return ""
    }
}


//MARK: - Count
extension PokerPlayers {
    
    enum Constants {
        static let defaultCount: PokerPlayers.Count = .two
    }
    
    enum Count: Int, CaseIterable {
        case one = 1
        case two
        case three
        case four
        case max
        
        var value: Int { self.rawValue }
        var index: Int { return self.rawValue - 1 }
    }
}
