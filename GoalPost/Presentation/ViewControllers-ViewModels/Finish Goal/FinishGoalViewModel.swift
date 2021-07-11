//
//  FinishGoalViewModel.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 11/07/2021.
//

import Foundation

class FinishGoalViewModel {
    // MARK:- Properties
    
    private let addGoalUsecase: AddGoalUsecase
    
    // MARK:- Methods
    
    init(addGoalUsecase: AddGoalUsecase) {
        self.addGoalUsecase = addGoalUsecase
    }
    
    func save(goalPresentationEntity: GoalPresentationEntity,
              completionHandler: () -> Void,
              errorHandler: (String) -> Void) {
        let goalDomainEntity = GoalPresentationMapper.map(goalPresentationEntity: goalPresentationEntity)
        
        addGoalUsecase.save(goalDomainEntity: goalDomainEntity,
                            completionHandler: completionHandler,
                            errorHandler: errorHandler)
    }
}
