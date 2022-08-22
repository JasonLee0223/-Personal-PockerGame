//
//  participants.swift
//  PockerGameApp
//
//  Created by 이건행 on 2022/05/11.
//

import Foundation

//MARK: 참가자의 역할 = 참가 인원 및 이름 파악
class Participant: CustomStringConvertible {
    
    let name: String
    private(set) var cards: [Card] = []
    
    var description: String {
        return "Name: \(name), cards: \(cards)"
    }
    
    init(name: String) {
        self.name = name
    }
}

extension Participant {
    func add(card: Card) {
        cards.append(card)
    }
    
    func removeAllCard() {
        cards.removeAll()
    }
}
