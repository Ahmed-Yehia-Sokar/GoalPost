//
//  DeleteGoalUsecase.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 12/07/2021.
//

import Foundation

class DeleteGoalUsecase {
    // MARK:- Properties
    
    private let goalRepository: GoalRepository
    
    // MARK:- Methods
    
    init(goalRepository: GoalRepository) {
        self.goalRepository = goalRepository
    }
    
    func delete(goalWithId goalId: String,
                completionHandler: () -> Void,
                errorHandler: (String) -> Void) {
        goalRepository.delete(goalWithId: goalId,
                              completionHandler: completionHandler,
                              errorHandler: errorHandler)
    }
}
