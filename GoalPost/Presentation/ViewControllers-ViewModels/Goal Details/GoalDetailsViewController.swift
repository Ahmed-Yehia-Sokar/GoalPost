//
//  GoalDetailsViewController.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 12/07/2021.
//

import UIKit

class GoalDetailsViewController: UIViewController {
    // MARK:- IBOutlets
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var goalTypeLable: UILabel!
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    
    // MARK:- Properties
    private var goalPresentationEntity: GoalPresentationEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalDescriptionTextView.layer.borderWidth = 0.5
        
        if let goalPresentationEntity = goalPresentationEntity {
            if goalPresentationEntity.progress == goalPresentationEntity.completionValue {
                progressLabel.text = "Completed"
            } else {
                progressLabel.text = "\(goalPresentationEntity.progress)"
            }
            
            goalTypeLable.text = goalPresentationEntity.type.rawValue
            goalDescriptionTextView.text = goalPresentationEntity.description
        }
    }
    
    // MARK:- IBActions
    
    @IBAction func onCloseButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Methods
    
    func initViewController(goalPresentationEntity: GoalPresentationEntity) {
        self.goalPresentationEntity = goalPresentationEntity
    }
}
