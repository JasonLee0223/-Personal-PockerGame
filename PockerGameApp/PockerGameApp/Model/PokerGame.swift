//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by 이건행 on 2022/05/11.
//

import Foundation

class PockerGame {
    
    private(set) var dealer: Dealer
    private(set) var players: participant
    private(set) var realPlayers: [String]
    private(set) var stud: Stud
    
    init(stud: Stud) {
        self.dealer = Dealer()
        self.players = participant()
        self.realPlayers = [String]()
        self.stud = stud
    }
    
    func joinDealer() -> [String] {
        
        for index in 0..<players.members {
            let tempMember = players.memberName[index]
            realPlayers.append(tempMember)
        }
        realPlayers.append(dealer.name)
        return realPlayers
    }
    
    func playStart() {
        if dealer.isPossiblePlay(count: stud.rawValue * players.members) {
            // 5카드 스터드일때 (5장 이상)
            joinDealer()
            var tempArr = [[Card]]()
            for index in 0...players.members {
                let temp = dealer.distributeCard(studNum: stud.rawValue)
                tempArr.append(temp)
                print("\(realPlayers[index]) \(tempArr[index])")
            }
        }
    }
}

extension PockerGame {
    
    enum Stud:Int {
        case five = 5
        case seven = 7
    }
    
}
