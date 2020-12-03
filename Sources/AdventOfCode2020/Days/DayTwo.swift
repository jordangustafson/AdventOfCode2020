//
//  DayTwo.swift
//  
//
//  Created by Jordan Gustafson on 12/2/20.
//

import Foundation

public struct DayTwo {
    
    public struct PasswordValidator {
        
        public struct PasswordEntry {
            let password: String
            let character: String
            let characterRuleOne: Int
            let CharacterRuleTwo: Int
        }
        
        public struct PasswordFileParser {
            
            public static func parse(fileName: String, bundle: Bundle) -> [PasswordEntry] {
                guard let rawStrings = try? DataParser<String>().parseLines(fileName: fileName, bundle: bundle) else {
                    fatalError("Could not read input.")
                }
                
                return rawStrings
                    .map { $0
                        .split(separator: " ")
                        .flatMap { $0.split(separator: "-") }
                        .map { $0.trimmingCharacters(in: CharacterSet(charactersIn: ":")) } }
                    .map { PasswordEntry(password: $0[3],
                                         character: $0[2],
                                         characterRuleOne: Int($0[0])!,
                                         CharacterRuleTwo: Int($0[1])!)
                    }
            }
            
        }
        
        public static func validateWithOccurenceCountRules(passwords: [PasswordEntry]) -> [PasswordEntry] {
            return passwords.filter { passwordEntry in
                let occurencesOfCharacter = passwordEntry.password.filter { $0 == Character(passwordEntry.character) }.count
                return passwordEntry.characterRuleOne <= occurencesOfCharacter && occurencesOfCharacter <= passwordEntry.CharacterRuleTwo
            }
        }
        
        public static func validateWithOccurenceIndexRules(passwords: [PasswordEntry]) -> [PasswordEntry] {
            return passwords.filter { passwordEntry in
                let password = passwordEntry.password
                let characterOne = String(password[password.index(password.startIndex, offsetBy: passwordEntry.characterRuleOne - 1)])
                let characterTwo = String(password[password.index(password.startIndex, offsetBy: passwordEntry.CharacterRuleTwo - 1)])
                return (characterOne == passwordEntry.character) != (characterTwo == passwordEntry.character)
            }
        }
        
    }
    
}
