//
//  PockerGameAppTests.swift
//  PockerGameAppTests
//
//  Created by Jason on 2022/05/13.
//

import XCTest
@testable import PockerGameApp

class PockerGameAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testCardDeckReset() {
        let cardDeck = CardDeck()
        
        let removeCount = 3
        (0..<removeCount).forEach { _ in
            guard let _ = cardDeck.removeOne() else { return }
        }
        XCTAssertEqual(cardDeck.deckCount, 52 - removeCount)
        cardDeck.reset()
        XCTAssertEqual(cardDeck.deckCount, 52, "카드덱 리셋 실패")
    }
    
    func testCardDeckRemoveOne() {
        let cardDeck = CardDeck()
        cardDeck.removeOne()
        XCTAssertEqual(cardDeck.deckCount, 51, "카드 뽑기 실패")
    }
    
    func testCardDeckShuffle() {
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        XCTAssertEqual(cardDeck.deckCount, 52)
    }

}
