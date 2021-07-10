//
//  GoalDatabaseSource.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import Foundation
import CoreData

class GoalDatabaseSource {
    // MARK:- Methods
    
    func save(goalDataEntity: GoalDataEntity,
              completionHandler: () -> Void,
              errorHandler: (String) -> Void) {
        guard let managedObjectContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedObjectContext)
        
        goal.goalDescription = goalDataEntity.description
        goal.goalType = goalDataEntity.type
        goal.goalCompletionValue = Int32(goalDataEntity.completionValue)
        goal.goalProgress = Int32(goalDataEntity.progress)
        
        do {
            try managedObjectContext.save()
            completionHandler()
        } catch {
            debugPrint(error.localizedDescription)
            errorHandler(error.localizedDescription)
        }
    }
}
