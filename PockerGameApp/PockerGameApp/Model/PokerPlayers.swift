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
        pokerStud.cardDistribution(playerCount: self.count, loopEvent: { playerIndex, cardIndex in
            guard let card = dealer.removeOne() else { return }
            self.addCard(at: playerIndex, card: card)
            addEventHandler(playerIndex, cardIndex, card)
        }, finishEvennt: finishEventHandler)
    }
    
    func getWinner() -> String? {
        players.reduce(into: [String:Score]()) { $0 [$1.name] = $1.score }
            .sorted { $0.value < $1.value}.last?.key
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
