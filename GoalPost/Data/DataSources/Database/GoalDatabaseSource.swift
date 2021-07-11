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
    
    func fetch(completionHandler: ([GoalDataEntity]) -> Void,
               errorHandler: (String) -> Void) {
        guard let managedObjectContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        var goalDataEntitiesArray = [GoalDataEntity]()
        
        do {
            let goalsArray = try managedObjectContext.fetch(fetchRequest)
            
            goalsArray.forEach { (goal: Goal) in
                let goalDataEntity = GoalDataEntity(description: goal.goalDescription ?? "",
                                                    type: goal.goalType ?? "",
                                                    completionValue: Int(goal.goalCompletionValue),
                                                    progress: Int(goal.goalProgress))
                
                goalDataEntitiesArray.append(goalDataEntity)
            }
            
            completionHandler(goalDataEntitiesArray)
        } catch {
            debugPrint("\(error.localizedDescription)")
            errorHandler(error.localizedDescription)
        }
    }
}
