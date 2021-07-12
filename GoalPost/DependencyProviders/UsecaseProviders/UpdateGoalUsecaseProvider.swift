//
//  UpdateGoalUsecaseProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 12/07/2021.
//

import Foundation

class UpdateGoalUsecaseProvider {
    // MARK:- Methods
    
    static func getUpdateGoalUsecase() -> UpdateGoalUsecase {
        let goalRepository = GoalRepositoryProvider.getGoalRepository()
        
        return UpdateGoalUsecase(goalRepository: goalRepository)
    }
}
