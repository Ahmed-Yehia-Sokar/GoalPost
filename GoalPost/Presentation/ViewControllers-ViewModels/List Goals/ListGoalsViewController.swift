//
//  ListGoalsViewController.swift
//  GoalPost
//
//  Created by Ahmed Yehia  on 10/07/2021.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ListGoalsViewController: UIViewController {
    // MARK:- IBOutlets
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var goalsTable: UITableView!
        
    // MARK:- Properties
    
    private let listGoalsViewModel = ListGoalsViewModelProvider.getListGoalsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- IBActions
    
    @IBAction func onAddGoalButtonTapped(_ sender: UIButton) {
    }
}

extension ListGoalsViewController: UITableViewDelegate {
    
}

extension ListGoalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let goalTableCell = goalsTable.dequeueReusableCell(withIdentifier: "GoalTableCell") as? GoalTableCell else {
            return GoalTableCell()
        }
        
        return goalTableCell
    }
}
