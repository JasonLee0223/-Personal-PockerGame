//
//  Card.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/01.
//

import Foundation

// 카드 정보를 담고 있는 구조체
// 구조체로 만든 이유는 카드 데이터의 경우 패턴 및 숫자의 값만 가지고 있으며,
// 이 값들이 외부에 의해 변환되거나, 수정이 이루어질 필요가 없기 때문이었다.
// 초기화 설정값만 사용하게된다.
struct Card: CustomStringConvertible, Comparable {
    
    let suitShape: Suitshape
    let suitCardNumber: SuitNumber
    
    init(suitShape: Suitshape, suitCardNumber: SuitNumber) {
        self.suitShape = suitShape
        self.suitCardNumber = suitCardNumber
    }
    
    var description: String {
        return "\(self.suitShape)\(self.suitCardNumber)"
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.suitCardNumber == rhs.suitCardNumber {
            return lhs.suitShape < rhs.suitShape
        }
        return lhs.suitCardNumber < rhs.suitCardNumber
    }
    
}

//MARK: - Card Pattern
extension Card {
    enum Suitshape: Int, CustomStringConvertible, CaseIterable, Comparable{
        case spade = 0
        case diamond
        case heart
        case clover
        
        var description: String {
            switch self {
            case .clover:
                return "c"
            case .diamond:
                return "d"
            case .heart:
                return "h"
            case .spade:
                return "s"
            }
        }
        
        static func < (lhs: Card.Suitshape, rhs: Card.Suitshape) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
        
    }
}

//MARK: - Card Number
extension Card {
    enum SuitNumber: Int, CustomStringConvertible, CaseIterable, Comparable{
        
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case Jack
        case Queen
        case King
        
        var description: String {
            switch(self) {
            case .ace:
                return "A"
            case .Jack:
                return "J"
            case .Queen:
                return "Q"
            case .King:
                return "K"
            default:
                return String(describing: self.rawValue)
            }
        }
        
        var value: Int {
            self.rawValue
        }
        
        static func < (lhs: Card.SuitNumber, rhs: Card.SuitNumber) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}
