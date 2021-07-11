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
    
    func configureCell(withGoal goalPresentationEnttiy: GoalPresentationEntity) {
        goalDescriptionLbl.text = goalPresentationEnttiy.description
        goalTypeLbl.text = goalPresentationEnttiy.type.rawValue
        goalProgressLbl.text = "\(goalPresentationEnttiy.progress)"
        
        if goalPresentationEnttiy.progress == goalPresentationEnttiy.completionValue {
            goalCompletedView.isHidden = false
        }
    }
}
