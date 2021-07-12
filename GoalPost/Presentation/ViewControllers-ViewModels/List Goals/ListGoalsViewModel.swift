//
//  ListGoalsViewModel.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class ListGoalsViewModel {
    // MARK:- Properties
    
    private let listGoalsUsecase: ListGoalsUsecase
    private let updateGoalUsecase: UpdateGoalUsecase
    private let deleteGoalUsecase: DeleteGoalUsecase
    
    // MARK:- Methods
    
    init(listGoalsUsecase: ListGoalsUsecase,
         updateGoalUsecase: UpdateGoalUsecase,
         deleteGoalUsecase: DeleteGoalUsecase) {
        self.listGoalsUsecase = listGoalsUsecase
        self.updateGoalUsecase = updateGoalUsecase
        self.deleteGoalUsecase = deleteGoalUsecase
    }
    
    func fetch(completionHandler: ([GoalPresentationEntity]) -> Void,
               errorHandler: (String) -> Void) {
        listGoalsUsecase.fetch(completionHandler: { goalDomainEntities in
            let goalPresentationEntities = GoalPresentationMapper.map(goalDomainEntities: goalDomainEntities)
            
            completionHandler(goalPresentationEntities)
        },
        errorHandler: errorHandler)
    }
    
    func updateProgress(goalPresentationEntity: GoalPresentationEntity,
                        completionHandler: () -> Void,
                        errorHandler: (String) -> Void) {
        let newProgress = goalPresentationEntity.progress + 1
        
        updateGoalUsecase.update(goalWithId: goalPresentationEntity.id,
                                 newProgressValue: newProgress,
                                 completionHandler: completionHandler,
                                 errorHandler: errorHandler)
    }
    
    func delete(goalWithId goalId: String,
                completionHandler: () -> Void,
                errorHandler: (String) -> Void) {
        deleteGoalUsecase.delete(goalWithId: goalId,
                                 completionHandler: completionHandler,
                                 errorHandler: errorHandler)
    }
}
