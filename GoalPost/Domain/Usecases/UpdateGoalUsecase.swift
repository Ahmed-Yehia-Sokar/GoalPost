//
//  UpdateGoalUsecase.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 12/07/2021.
//

import Foundation

class UpdateGoalUsecase {
    // MARK:- Properties
    
    private let goalRepository: GoalRepository
    
    // MARK:- Methods
    
    init(goalRepository: GoalRepository) {
        self.goalRepository = goalRepository
    }
    
    func update(goalWithId goalId: String,
                newProgressValue: Int,
                completionHandler: () -> Void,
                errorHandler: (String) -> Void) {
        goalRepository.update(goalWithId: goalId,
                              newProgressValue: newProgressValue,
                              completionHandler: completionHandler,
                              errorHandler: errorHandler)
    }
}
