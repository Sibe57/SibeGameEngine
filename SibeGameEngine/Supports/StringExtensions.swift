//
//  StringExtensions.swift
//  SibeGameEngine
//
//  Created by admin on 22.06.2024.
//

import Foundation

/// An extension to format strings in *snake case*.
extension String {
    
    private var words: [String] {
        var words: [String] = []
        var currentWord: String = ""
        
        for character in self {
            if character.isUppercase && !currentWord.isEmpty {
                words.append(currentWord)
                currentWord = String(character)
            } else {
                currentWord.append(character)
            }
        }
        
        if !currentWord.isEmpty {
            words.append(currentWord)
        }
        
        return words
    }

    func lowerSnakeCased() -> String {
        return self.words.map({ $0.lowercased() }).joined(separator: "_")
    }

    func upperSnakeCased() -> String {
        return self.words.map({ $0.uppercased() }).joined(separator: "_")
    }

    func mixedSnakeCased() -> String {
        return self.words.joined(separator: "_")
    }
}
