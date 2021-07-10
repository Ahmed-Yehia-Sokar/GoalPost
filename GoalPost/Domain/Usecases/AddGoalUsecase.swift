//
//  AddGoalUsecase.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class AddGoalUsecase {
    // MARK:- Properties
    
    private let goalRepository: GoalRepository
    
    // MARK:- Methods
    
    init(goalRepository: GoalRepository) {
        self.goalRepository = goalRepository
    }
    
    func save(goalDomainEntity: GoalDomainEntity,
              completionHandler: () -> Void,
              errorHandler: (String) -> Void) {
        goalRepository.save(goalDomainEntity: goalDomainEntity,
                            completionHandler: completionHandler,
                            errorHandler: errorHandler)
    }
}
