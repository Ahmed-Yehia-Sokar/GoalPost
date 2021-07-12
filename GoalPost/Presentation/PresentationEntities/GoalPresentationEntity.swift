//
//  GoalPresentationEntity.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

struct GoalPresentationEntity {
    // MARK:- Properties
    
    let id: String
    let description: String
    let type: GoalType
    let completionValue: Int
    let progress: Int
}
