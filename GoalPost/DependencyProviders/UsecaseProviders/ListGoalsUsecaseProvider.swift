//
//  ListGoalsUsecaseProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 11/07/2021.
//

import Foundation

class ListGoalUsecaseProvider {
    // MARK:- Methods
    
    static func getListGoalsUsecase() -> ListGoalsUsecase {
        let goalRepository = GoalRepositoryProvider.getGoalRepository()
        
        return ListGoalsUsecase(goalRepository: goalRepository)
    }
}
