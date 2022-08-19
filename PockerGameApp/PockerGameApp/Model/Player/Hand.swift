//
//  Hand.swift
//  PockerGameApp
//
//  Created by 이건행 on 2022/05/11.
//

import Foundation

//MARK: 카드를 한 장씩 뽑아 배열에 저장하는 역할

class Hand {
    
    private var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
    
    func receive(card: Card) {
        self.cards.append(card)
    }
    
}
