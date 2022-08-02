//
//  participants.swift
//  PockerGameApp
//
//  Created by 이건행 on 2022/05/11.
//

import Foundation

//MARK: 참가자의 역할 = 참가 인원 및 이름 파악
struct participant {
    
    private(set) var members: Int
    private(set) var memberName: [String]
    
    init() {
        self.members = Int.random(in: 1...4)
        self.memberName = ["JK", "Honux", "Chole", "Jack", "Lee"]
    }
    
}
