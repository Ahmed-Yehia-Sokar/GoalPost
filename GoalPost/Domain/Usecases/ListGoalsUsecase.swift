//
//  ListGoalsUsecase.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 11/07/2021.
//

import Foundation

class ListGoalsUsecase {
    // MARK:- Properties
    
    private let goalRepository: GoalRepository
    
    // MARK:- Methods
    
    init(goalRepository: GoalRepository) {
        self.goalRepository = goalRepository
    }
    
    func fetch(completionHandler: ([GoalDomainEntity]) -> Void,
                errorHandler: (String) -> Void) {
        goalRepository.fetch(completionHandler: completionHandler,
                             errorHandler: errorHandler)
    }
}
