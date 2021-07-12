//
//  GoalTableCell.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import UIKit

class GoalTableCell: UITableViewCell {
    // MARK:- IBOutlets
    
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var goalCompletedView: UIView!
    
    // MARK:- Methods
    
    func configureCell(withGoal goalPresentationEntity: GoalPresentationEntity) {
        goalDescriptionLbl.text = goalPresentationEntity.description
        goalTypeLbl.text = goalPresentationEntity.type.rawValue
        goalProgressLbl.text = "\(goalPresentationEntity.progress)"
        
        if goalPresentationEntity.progress == goalPresentationEntity.completionValue {
            goalCompletedView.isHidden = false
        } else {
            goalCompletedView.isHidden = true
        }
    }
}
