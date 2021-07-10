//
//  GoalRepositoryProvider.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation

class GoalRepositoryProvider {
    // MARK:- Methods
    
    static func getGoalRepository() -> GoalRepository {
        let goalDatabaseSource = GoalDatabaseSource()
        
        return GoalRepository(goalDatabaseSource: goalDatabaseSource)
    }
}
