//
//  PockerGameAppTests.swift
//  PockerGameAppTests
//
//  Created by Jason on 2022/05/13.
//

import XCTest
@testable import PockerGameApp

class PockerGameAppTests: XCTestCase {
    var systemUnderTest: PockerGame!

    override func setUpWithError() throws {
        try super.setUpWithError()
        systemUnderTest = PockerGame(stud: .seven)
    }

    override func tearDownWithError() throws {
//        pockergame = nil
//        dealer = nil
    }

    func testPockerGame() throws {
//        pockergame.playStart()
    }

}
