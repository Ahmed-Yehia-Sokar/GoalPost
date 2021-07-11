//
//  FinishGoalViewModelProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 11/07/2021.
//

import Foundation

class FinishGoalViewModelProvider {
    static func getFinishGoalViewModel() -> FinishGoalViewModel {
        let addGoalUsecase = AddGoalUsecaseProvider.getAddGoalUsecase()
        
        return FinishGoalViewModel(addGoalUsecase: addGoalUsecase)
    }
}
