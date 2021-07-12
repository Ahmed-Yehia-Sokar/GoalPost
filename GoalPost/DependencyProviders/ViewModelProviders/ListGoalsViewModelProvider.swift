//
//  ListGoalsViewModelProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class ListGoalsViewModelProvider {
    // MARK:- Methods
    
    static func getListGoalsViewModel() -> ListGoalsViewModel {
        let listGoalsUsecase = ListGoalsUsecaseProvider.getListGoalsUsecase()
        let updateGoalUsecase = UpdateGoalUsecaseProvider.getUpdateGoalUsecase()
        let deleteGoalUsecase = DeleteGoalUsecaseProvider.getDeleteGoalUsecase()
        
        return ListGoalsViewModel(listGoalsUsecase: listGoalsUsecase,
                                  updateGoalUsecase: updateGoalUsecase,
                                  deleteGoalUsecase: deleteGoalUsecase)
    }
}
