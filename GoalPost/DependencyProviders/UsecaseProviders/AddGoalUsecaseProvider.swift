//
//  AddGoalUsecaseProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class AddGoalUsecaseProvider {
    // MARK:- Methods
    
    static func getAddGoalUsecase() -> AddGoalUsecase {
        let goalRepository = GoalRepositoryProvider.getGoalRepository()
        
        return AddGoalUsecase(goalRepository: goalRepository)
    }
}
