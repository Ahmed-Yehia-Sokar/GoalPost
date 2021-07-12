//
//  GoalDomainEntity.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

struct GoalDomainEntity {
    // MARK:- Properties
    
    let id: String
    let description: String
    let type: GoalType
    let completionValue: Int
    let progress: Int
}
