//
//  GoalDataMapper.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class GoalDataMapper {
    // MARK:- Methods
    
    static func map(goalDomainEntity: GoalDomainEntity) -> GoalDataEntity {
        let goalType = goalDomainEntity.type.rawValue
        
        return GoalDataEntity(id: goalDomainEntity.id,
                              description: goalDomainEntity.description,
                              type: goalType,
                              completionValue: goalDomainEntity.completionValue,
                              progress: goalDomainEntity.progress)
    }
    
    static func map(goalDataEntity: GoalDataEntity) -> GoalDomainEntity {
        let goalType = GoalType(rawValue: goalDataEntity.type) ?? .longTerm
        
        return GoalDomainEntity(id: goalDataEntity.id,
                                description: goalDataEntity.description,
                                type: goalType,
                                completionValue: goalDataEntity.completionValue,
                                progress: goalDataEntity.progress)
    }
    
    static func map(goalDomainEntities: [GoalDomainEntity]) -> [GoalDataEntity] {
        goalDomainEntities.map(map(goalDomainEntity:))
    }
    
    static func map(goalDataEntities: [GoalDataEntity]) -> [GoalDomainEntity] {
        goalDataEntities.map(map(goalDataEntity:))
    }
}
