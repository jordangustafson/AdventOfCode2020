//
//  DayTwoTests.swift
//  
//
//  Created by Jordan Gustafson on 12/2/20.
//

import XCTest
@testable import AdventOfCode2020

final class DayTwoTests: XCTestCase {
    
    func testExamplePasswordList() {
        let examplePasswordList = DayTwo.PasswordValidator.PasswordFileParser.parse(fileName: "ExamplePasswordList", bundle: .module)
        let validOccurencePasswords = DayTwo.PasswordValidator.validateWithOccurenceCountRules(passwords: examplePasswordList)
        let validIndexPasswords = DayTwo.PasswordValidator.validateWithOccurenceIndexRules(passwords: examplePasswordList)
        XCTAssert(validOccurencePasswords.count == 2)
        XCTAssert(validIndexPasswords.count == 1)
    }
    
    func testPasswordList() {
        let passwordList = DayTwo.PasswordValidator.PasswordFileParser.parse(fileName: "PasswordList", bundle: .module)
        let validOccurencePasswords = DayTwo.PasswordValidator.validateWithOccurenceCountRules(passwords: passwordList)
        let validIndexPasswords = DayTwo.PasswordValidator.validateWithOccurenceIndexRules(passwords: passwordList)
        XCTAssert(validOccurencePasswords.count == 569)
        XCTAssert(validIndexPasswords.count == 346)
    }

    static var allTests = [
        ("testExamplePasswordList", testExamplePasswordList),
        ("testPasswordList", testPasswordList),
    ]
}
