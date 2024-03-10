//
//  Root.swift
//  DataStructures
//
//  Created by Mohit Kumar Singh on 10/03/24.
//

import Foundation

class Root {
    static let shared = Root()
    
    weak var arrayDelegate: ArrayQuestionsProtocol?
    
    private init() {
        
    }
    
    func runArrayQuestion() {
        self.arrayDelegate?.runArrayQuestion()
    }
}
