//
//  FeedModel.swift
//  Navigation
//
//  Created by Roman Romanov on 14.04.2023.
//

import Foundation

final class FeedModel {
    private let secretWord = "Secret"
    
    func check(word: String) -> Bool {
        self.secretWord == word
    }
}
