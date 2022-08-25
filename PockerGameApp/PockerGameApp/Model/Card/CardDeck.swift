//
//  Deck.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/07.
//

import Foundation

// 덱은 초기화시 CardData를 52장을 가지고 있으며,
// 덱의 카드의 수가 줄거나, 셔플, 한장 빼기등 CardData를 관리함.
// 데이터의 변형이 일어남으로 클래스로 관리
class CardDeck: CustomStringConvertible {
    
    private var deck: [Card] = []
    
    var description: String {
        return "\(deck)\ncount: \(deck.count)"
    }
    
    var deckCount: Int {
        deck.count 
    }
    
    init() {
        reset()
    }
}
extension CardDeck {
    
    func shuffle() {
        (0..<deckCount).forEach{ index in
            let randomIndex = Int.random(in: index..<deckCount)
            let targetCard = deck[index]
            let randomCard = deck[randomIndex]
            deck[index] = randomCard
            deck[randomIndex] = targetCard
        }
    }
    
    func removeOne() -> Card? {
        if deck.isEmpty { return nil }
        
        let randomIndex = Int.random(in: 0..<deckCount)
        return deck.remove(at: randomIndex)
    }
    
    func reset() {
        deck = Card.Suitshape.allCases.reduce([]) { resultDeck, pattern in
            resultDeck + Card.SuitNumber.allCases.map {
                Card(suitShape: pattern, suitCardNumber: $0)
            }
        }
    }
}
