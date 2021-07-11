//
//  CreateGoalViewController.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 11/07/2021.
//

import UIKit

class CreateGoalViewController: UIViewController {
    // MARK:- IBOutlets
    
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    
    // MARK:- Properties
    
    private var goalType = GoalType.shortTerm

    // MARK:- View Controller Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goalDescriptionTextView.layer.borderWidth = 0.5
    }
    
    // MARK:- IBActions

    @IBAction func onCloseButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onShortTermButtonTapped(_ sender: UIButton) {
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
        goalType = .shortTerm
    }
    
    @IBAction func onLongTermButtonTapped(_ sender: UIButton) {
        shortTermButton.setDeselectedColor()
        longTermButton.setSelectedColor()
        goalType = .longTerm
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        guard let goalDescription = goalDescriptionTextView.text,
              !goalDescription.isEmpty,
              goalDescription != "What is your goal?" else { return }
        let viewController = storyboard?.instantiateViewController(withIdentifier: "FinishGoalViewController")
        guard let finishGoalViewController = viewController as? FinishGoalViewController else {
            return
        }
        guard let presentingViewController = presentingViewController else {
            return
        }
        
        finishGoalViewController.initViewController(withGoalDescription: goalDescription,
                                                    goalType: goalType)
        dismiss(animated: true) {
            presentingViewController.present(finishGoalViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func onBackgroundTapped(_ sender: UITapGestureRecognizer) {
        goalDescriptionTextView.endEditing(true)
        
        if let goalDescription = goalDescriptionTextView.text,
           goalDescription.isEmpty {
            goalDescriptionTextView.text = "What is your goal?"
            goalDescriptionTextView.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
}

extension CreateGoalViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
