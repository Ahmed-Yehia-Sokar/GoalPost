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
    
    private var goalsPresentationEntities = [GoalPresentationEntity]()
    private let listGoalsViewModel = ListGoalsViewModelProvider.getListGoalsViewModel()
    
    // MARK:- View Controller Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listGoalsViewModel.fetch(completionHandler: { [unowned self] goalsPresentationEntities in
            if !goalsPresentationEntities.isEmpty {
                self.emptyView.isHidden = true
            }
            
            self.goalsPresentationEntities = goalsPresentationEntities
            self.goalsTable.reloadData()
        },
        errorHandler: errorHandler)
    }
    
    // MARK:- IBActions
    
    @IBAction func onAddGoalButtonTapped(_ sender: UIButton) {
        guard let createGoalViewController = storyboard?.instantiateViewController(withIdentifier: "CreateGoalViewController") else {
            return
        }
        present(createGoalViewController, animated: true, completion: nil)
    }
    
    // MARK:- Methods
    
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

extension ListGoalsViewController: UITableViewDelegate {
    
}

extension ListGoalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsPresentationEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let goalTableCell = goalsTable.dequeueReusableCell(withIdentifier: "GoalTableCell") as? GoalTableCell else {
            return GoalTableCell()
        }
        let goal = goalsPresentationEntities[indexPath.row]
        
        goalTableCell.configureCell(withGoal: goal)
        
        return goalTableCell
    }
}
