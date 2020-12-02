//
//  DayOneTests.swift
//  
//
//  Created by Jordan Gustafson on 12/1/20.
//

import XCTest
@testable import AdventOfCode2020

final class AdventOfCode2020Tests: XCTestCase {
    
    func testExampleExpenseReport() {
        let exampleExpenseReport = [1721,
                                    979,
                                    366,
                                    299,
                                    675,
                                    1456]
        guard let pair = DayOne.ExpenseReportSearcher.findTwentyTwentyPair(inExpenses: exampleExpenseReport) else {
            XCTFail("No 2020 pair found")
            return
        }
        
        guard let triplet = DayOne.ExpenseReportSearcher.findTwentyTwentyTriplet(inExpenses: exampleExpenseReport) else {
            XCTFail("No 2020 pair found")
            return
        }

        XCTAssert(pair == (1721, 299) || pair == (299, 1721))
        XCTAssert(triplet == (979, 366, 675))
    }
    
    func testMyExpenseReport() {
        guard let expenseReport = try? DataParser<Int>().parseLines(fileName: "ExpenseReport", bundle: Bundle.module) else {
            fatalError("Could not read input.")
        }
        
        guard let pair = DayOne.ExpenseReportSearcher.findTwentyTwentyPair(inExpenses: expenseReport) else {
            XCTFail("No 2020 pair found")
            return
        }
        
        guard let triplet = DayOne.ExpenseReportSearcher.findTwentyTwentyTriplet(inExpenses: expenseReport) else {
            XCTFail("No 2020 pair found")
            return
        }
        
        XCTAssert(pair == (547, 1473))
        XCTAssert(triplet == (438, 360, 1222))
    }

    static var allTests = [
        ("testExampleExpenseReport", testExampleExpenseReport),
    ]
}
