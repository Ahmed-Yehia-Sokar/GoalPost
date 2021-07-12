//
//  FinishGoalViewController.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 11/07/2021.
//

import UIKit

class FinishGoalViewController: UIViewController {
    // MARK:- IBOutlets
    
    @IBOutlet weak var pointsTextField: UITextField!
    
    // MARK:- Properties
    
    private let finishGoalViewModel = FinishGoalViewModelProvider.getFinishGoalViewModel()
    private var goalDescription = ""
    private var goalType = GoalType.shortTerm
    
    // MARK:- View Controller Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- IBActions
    
    @IBAction func onCloseButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateGoalButtonTapped(_ sender: UIButton) {
        guard let pointsValue = pointsTextField.text, pointsValue != "" else { return }
        let pointsAsInt = Int(pointsValue) ?? 0
        let identifier = UUID().uuidString
        let goalPresentationEntity = GoalPresentationEntity(id: identifier,
                                                            description: goalDescription,
                                                            type: goalType,
                                                            completionValue: pointsAsInt,
                                                            progress: 0)
        
        finishGoalViewModel.save(goalPresentationEntity: goalPresentationEntity,
                                 completionHandler: completionHandler,
                                 errorHandler: errorHandler)
    }
    
    // MARK:- Methods
    
    func initViewController(withGoalDescription description: String,
                            goalType: GoalType) {
        self.goalDescription = description
        self.goalType = goalType
    }
    
    private func completionHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    private func errorHandler(errorMessage: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: errorMessage,
                                                preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        alertController.addAction(doneAction)
        present(alertController,
                animated: true,
                completion: nil)
    }
}
