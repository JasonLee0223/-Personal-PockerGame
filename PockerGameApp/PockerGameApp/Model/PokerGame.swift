//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by 이건행 on 2022/05/11.
//

import Foundation

class PokerGame {
    
    var action = Action()
    var state = State()
    private var pokerPlayers = PokerPlayers()
    private var dealer = Dealer()
    
    private var pokerStud = Constants.defaultPockerStud
    private var playerCount = PokerPlayers.Constants.defaultCount
    
    init() {
        action.pokerPlay = play
        action.pokerReset = { self.resetGame() }
        
        action.inputPlayerCount = { playerCount in
            self.playerCount = playerCount
            self.state.resetPockerBoard(self.pokerStud, self.pokerPlayers.names)
        }
        
        action.inputPockerStud = { pokerStud in
            self.pokerStud = pokerStud
            self.resetGame()
        }
    }
}

//MARK: - Business Logic
extension PokerGame {
    
    func resetGame() {
        pokerPlayers.removeAllPlayer()
        pokerPlayers.addPlayers(players: self.makeNewPlayers(count: playerCount))
        pokerPlayers.addPlayer(player: dealer)
        state.resetPockerBoard(pokerStud, pokerPlayers.names)
    }
    
    private func play() {
        pokerPlayers.removeAllCard()
        dealer.cardShuffle()
        
        if dealer.hasRemainCardCount(stud: pokerStud, playerCount: pokerPlayers.count) == false {
            self.state.finishPocker()
            return
        }
        pokerPlayers.cardDistribution(dealer: dealer, pokerStud: pokerStud, addEventHandler: self.state.givePlayerCard, finishEventHandler: { self.state.pokerWinner(self.pokerPlayers.getWinner())
        })
    }
    
    private func makeNewPlayers(count: PokerPlayers.Count) -> [Participant] {
        var nameData = ["Shingha", "Bibi", "Alex", "Rosa", "Chez",
                        "Ocean", "Jason", "Dale", "Kai", "Jee",
                        "Mase", "Sol", "Ebony", "Gucci", "Zed",
                        "Beck", "Eddy", "Selina", "Pigbag", "Chole"]
        var players = [Participant]()
        while players.count != count.value {
            let randomIndex = Int.random(in: 0..<nameData.count)
            let name = nameData.remove(at: randomIndex)
            if name.count < 2 || name.count > 5 { continue }
            players.append(Participant(name: name))
        }
        return players
    }
}

//MARK: - Parameter 선언 부
extension PokerGame {
    
    enum Constants {
        static let defaultPockerStud = PokerGame.Stud.fiveCard
    }
    
    struct Action {
        var pokerPlay: () -> Void = { }
        var pokerReset: () -> Void = { }
        var inputPockerStud: (Stud) -> Void = { _ in }
        var inputPlayerCount: (PokerPlayers.Count) -> Void = { _ in }
    }
    
    struct State {
        var resetPockerBoard: (Stud, [String]) -> Void = { _, _ in }
        var givePlayerCard: (Int, Int, Card) -> Void = { _, _, _ in }
        var pokerWinner: (String?) -> Void = { _ in }
        var finishPocker: () -> Void = { }
    }
}

//MARK: - Poker Stud 집합 부
extension PokerGame {
    
    enum Stud:CaseIterable {
        case sevenCard
        case fiveCard
        
        var cardCount: Int {
            switch self {
            case .sevenCard: return 7
            case .fiveCard: return 5
            }
        }
        
        var index: Int {
            switch self {
            case .sevenCard: return 0
            case .fiveCard: return 1
            }
        }
        
        func cardDistribution(playerCount: PokerPlayers.Count,
                              loopEvent: @escaping (_ playerIndex: Int, _ cardIndex: Int) -> Void,
                              finishEvennt: @escaping () -> Void) {
            let maxLoopCount = cardCount * playerCount.value
            let speed = 0.3
            var loopCount = 0
            
            Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
                let cardIndex = loopCount / playerCount.value
                let playerIndex = loopCount % playerCount.value
                
                loopEvent(playerIndex, cardIndex)
                loopCount += 1
                
                if maxLoopCount == loopCount {
                    finishEvennt()
                    timer.invalidate()
                }
            }
        }
    }
}
