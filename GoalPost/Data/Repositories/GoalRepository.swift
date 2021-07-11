//
//  GoalRepository.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class GoalRepository {
    // MARK:- Properties
    
    private let goalDatabaseSource: GoalDatabaseSource
    
    // MARK:- Methods
    
    init(goalDatabaseSource: GoalDatabaseSource) {
        self.goalDatabaseSource = goalDatabaseSource
    }
    
    func save(goalDomainEntity: GoalDomainEntity,
              completionHandler: () -> Void,
              errorHandler: (String) -> Void) {
        let goalDataEntity = GoalDataMapper.map(goalDomainEntity: goalDomainEntity)
        
        goalDatabaseSource.save(goalDataEntity: goalDataEntity,
                                completionHandler: completionHandler,
                                errorHandler: errorHandler)
    }
    
    func fetch(completionHandler: ([GoalDomainEntity]) -> Void,
               errorHandler: (String) -> Void) {
        goalDatabaseSource.fetch(completionHandler: { goalDataEntities in
            let goalDomainEntities = GoalDataMapper.map(goalDataEntities: goalDataEntities)
            
            completionHandler(goalDomainEntities)
        },
        errorHandler: errorHandler)
    }
}
