//
//  DayOne.swift
//  
//
//  Created by Jordan Gustafson on 12/1/20.
//

import Algorithms

public struct DayOne {
    
    public struct ExpenseReportSearcher {
        /// Return the two numbers from the given expenses that sum to 2020
        /// - Parameter expenses: The expenses to search through
        /// - Returns: The pair of expense if they exist, nil if they don't
        public static func findTwentyTwentyPair(inExpenses expenses: [Int]) -> (Int, Int)? {
            let result = expenses
                .combinations(ofCount: 2)
                .first(where: { $0[0] + $0[1] == 2020 })
                .map { ($0[0], $0[1]) }
            return result
        }
        /// Return the three numbers from the given expenses that sum to 2020
        /// - Parameter expenses: The expenses to search through
        /// - Returns: The pair of expense if they exist, nil if they don't
        public static func findTwentyTwentyTriplet(inExpenses expenses: [Int]) -> (Int, Int, Int)? {
            let result = expenses
                .combinations(ofCount: 3)
                .first(where: { $0[0] + $0[1] + $0[2] == 2020 })
                .map { ($0[0], $0[1], $0[2]) }
            return result
        }
    }
    
}

