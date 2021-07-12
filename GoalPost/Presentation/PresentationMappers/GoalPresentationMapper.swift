//
//  GoalPresentationMapper.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class GoalPresentationMapper {
    // MARK:- Methods
    
    static func map(goalPresentationEntity: GoalPresentationEntity) -> GoalDomainEntity {
        return GoalDomainEntity(id: goalPresentationEntity.id,
                                description: goalPresentationEntity.description,
                                type: goalPresentationEntity.type,
                                completionValue: goalPresentationEntity.completionValue,
                                progress: goalPresentationEntity.progress)
    }
    
    static func map(goalDomainEntity: GoalDomainEntity) -> GoalPresentationEntity {
        return GoalPresentationEntity(id: goalDomainEntity.id,
                                      description: goalDomainEntity.description,
                                      type: goalDomainEntity.type,
                                      completionValue: goalDomainEntity.completionValue,
                                      progress: goalDomainEntity.progress)
    }
    
    static func map(goalPresentationEntities: [GoalPresentationEntity]) -> [GoalDomainEntity] {
        goalPresentationEntities.map(map(goalPresentationEntity:))
    }
    
    static func map(goalDomainEntities: [GoalDomainEntity]) -> [GoalPresentationEntity] {
        goalDomainEntities.map(map(goalDomainEntity:))
    }
}
