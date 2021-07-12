//
//  DeleteGoalUsecaseProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 12/07/2021.
//

import Foundation

class DeleteGoalUsecaseProvider {
    // MARK:- Methods
    
    static func getDeleteGoalUsecase() -> DeleteGoalUsecase {
        let goalRepository = GoalRepositoryProvider.getGoalRepository()
        
        return DeleteGoalUsecase(goalRepository: goalRepository)
    }
}
