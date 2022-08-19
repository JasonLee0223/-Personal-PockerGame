//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 이건행 on 2022/05/11.
//

import Foundation

//MARK: 딜러의 역할
// 3. 참가자의 역할로서도 카드를 같이 나눠받는다.
class Dealer {
    
    private(set) var makeDeck: [Card]
    private(set) var originDeck: Deck
    private(set) var hand: Hand
    let name: String
    
    init() {
        self.makeDeck = [Card]()
        self.originDeck = Deck()
        self.hand = Hand()
        self.name = "Dealer"
    }
    
    // 2. 카드덱에서 카드를 뽑아 덱에 담아서 참가자들에게 전달해준다.
    func distributeCard(studNum:Int) -> [Card] {
        var tempArr = [Card]()
        
        if studNum == 5 || studNum == 7 {
            for _ in 0..<studNum {
                let temp = originDeck.removeOne()
                tempArr.append(temp)
            }
            makeDeck = tempArr
            tempArr = []
            return makeDeck
        } else {
            exit(1)
        }
    }
    
    //카드덱에 얼마나 남아있는지 갯수 확인하여 실행여부 확인
    func isPossiblePlay(count:Int) -> Bool {
        return self.originDeck.count() >= count
    }
    
    //카드를 모두 초기화하고 셔플하는 역할
    func generateShuffleDeck() {
        self.originDeck.reset()
        self.originDeck.shuffle()
    }
    
    //포커게임을 시작
    func getStartPockerGame(stud: Int) {
        self.generateShuffleDeck()
    }
    
}
