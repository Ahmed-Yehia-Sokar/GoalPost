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
    
    // MARK:- Methods
    
    init(listGoalsUsecase: ListGoalsUsecase) {
        self.listGoalsUsecase = listGoalsUsecase
    }
    
    func fetch(completionHandler: ([GoalPresentationEntity]) -> Void,
               errorHandler: (String) -> Void) {
        listGoalsUsecase.fetch(completionHandler: { goalDomainEntities in
            let goalPresentationEntities = GoalPresentationMapper.map(goalDomainEntities: goalDomainEntities)
            
            completionHandler(goalPresentationEntities)
        },
        errorHandler: errorHandler)
    }
}
