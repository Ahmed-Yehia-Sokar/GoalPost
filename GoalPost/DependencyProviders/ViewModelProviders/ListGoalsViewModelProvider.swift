//
//  ListGoalsViewModelProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class ListGoalsViewModelProvider {
    static func getListGoalsViewModel() -> ListGoalsViewModel {
        let addGoalUsecase = AddGoalUsecaseProvider.getAddGoalUsecase()
        
        return ListGoalsViewModel(addGoalUsecase: addGoalUsecase)
    }
}
