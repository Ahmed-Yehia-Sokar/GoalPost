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
        managedObjectContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        
        // Create a managed onject from Goal entity. insert it into managed object context.
        let goal = Goal(context: managedObjectContext)
        goal.goalID = goalDataEntity.id
        goal.goalDescription = goalDataEntity.description
        goal.goalType = goalDataEntity.type
        goal.goalCompletionValue = Int64(goalDataEntity.completionValue)
        goal.goalProgress = Int64(goalDataEntity.progress)
        
        do {
            // Commit unsaved changes from managed object context in coordinator.
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
        // Prepare the request of type NSFetchRequest for the required entity
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        var goalDataEntitiesArray = [GoalDataEntity]()
        
        do {
            let goalsArray = try managedObjectContext.fetch(fetchRequest)
            
            goalsArray.forEach { (goal: Goal) in
                let goalDataEntity = GoalDataEntity(id: goal.goalID ?? "",
                                                    description: goal.goalDescription ?? "",
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
    
    func update(goalWithId goalId: String,
                newProgressValue: Int,
                completionHandler: () -> Void,
                errorHandler: (String) -> Void) {
        guard let managedObjectContext = appDelegate?.persistentContainer.viewContext else { return }
        let predicate = NSPredicate(format: "goalID == %@", goalId)
        // Prepare the request of type NSFetchRequest for the required entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        request.predicate = predicate
        
        do {
            let matchedObjects = try managedObjectContext.fetch(request)
           
            if let matchedObject = matchedObjects[0] as? Goal {
                matchedObject.goalProgress = Int64(newProgressValue)
            }
            // Commit unsaved changes from managed object context in coordinator.
            try managedObjectContext.save()
            completionHandler()
        } catch {
            debugPrint(error.localizedDescription)
            errorHandler(error.localizedDescription)
        }
    }
    
    func delete(goalWithId goalId: String,
                completionHandler: () -> Void,
                errorHandler: (String) -> Void) {
        guard let managedObjectContext = appDelegate?.persistentContainer.viewContext else { return }
        let predicate = NSPredicate(format: "goalID == %@", goalId)
        // Prepare the request of type NSFetchRequest for the required entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        request.predicate = predicate
        
        do {
            let matchedObjects = try managedObjectContext.fetch(request)
            
            if let matchedObject = matchedObjects[0] as? NSManagedObject {
                managedObjectContext.delete(matchedObject)
            }
            // Commit unsaved changes from managed object context in coordinator.
            try managedObjectContext.save()
            completionHandler()
        } catch {
            debugPrint(error.localizedDescription)
            errorHandler(error.localizedDescription)
        }
    }
}
