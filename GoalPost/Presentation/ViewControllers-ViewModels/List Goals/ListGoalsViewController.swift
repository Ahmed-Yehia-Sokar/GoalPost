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
    
    private var goalEntities = [GoalPresentationEntity]()
    private let listGoalsViewModel = ListGoalsViewModelProvider.getListGoalsViewModel()
    
    // MARK:- View Controller Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchGoals()
    }
    
    // MARK:- IBActions
    
    @IBAction func onAddGoalButtonTapped(_ sender: UIButton) {
        guard let createGoalViewController = storyboard?.instantiateViewController(withIdentifier: "CreateGoalViewController") else {
            return
        }
        present(createGoalViewController, animated: true, completion: nil)
    }
    
    // MARK:- Methods
    private func fetchGoals() {
        listGoalsViewModel.fetch(completionHandler: { [unowned self] goalPresentationEntities in
            if !goalPresentationEntities.isEmpty {
                self.goalsTable.isHidden = false
                self.emptyView.isHidden = true
            }
            
            self.goalEntities = goalPresentationEntities
            self.goalsTable.reloadData()
        },
        errorHandler: errorHandler)
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

extension ListGoalsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var actionsArray = [UIContextualAction]()
        let selectedGoal = goalEntities[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] (action, view, completionHandler) in
            self.listGoalsViewModel.delete(goalWithId: selectedGoal.id,
                                           completionHandler: { [unowned self] in
                                            self.goalEntities.remove(at: indexPath.row)
                                            self.goalsTable.deleteRows(at: [indexPath], with: .automatic)
                                            
                                            if self.goalEntities.isEmpty {
                                                self.goalsTable.isHidden = true
                                                self.emptyView.isHidden = false
                                            }
                                           },
                                           errorHandler: errorHandler)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        actionsArray.append(deleteAction)
        
        if selectedGoal.progress < selectedGoal.completionValue {
            let addAction = UIContextualAction(style: .normal,
                                               title: "Add 1") { [unowned self] (action, view, completionHandler) in
                self.listGoalsViewModel.updateProgress(goalPresentationEntity: selectedGoal,
                                                       completionHandler: { [unowned self] in
                                                        self.fetchGoals()
                                                        self.goalsTable.reloadData()
                                                       },
                                                       errorHandler: errorHandler)
                completionHandler(true)
            }
            addAction.backgroundColor = .systemGreen
            actionsArray.append(addAction)
        }
        return UISwipeActionsConfiguration(actions: actionsArray)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGoal = goalEntities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: "GoalDetailsViewController")
        guard let goalDetailsViewController = viewController as? GoalDetailsViewController else {
            return
        }
        
        goalDetailsViewController.initViewController(goalPresentationEntity: selectedGoal)
        
        present(goalDetailsViewController, animated: true, completion: nil)
    }
}

extension ListGoalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let goalTableCell = goalsTable.dequeueReusableCell(withIdentifier: "GoalTableCell") as? GoalTableCell else {
            return GoalTableCell()
        }
        let goal = goalEntities[indexPath.row]
        
        goalTableCell.configureCell(withGoal: goal)
        return goalTableCell
    }
}
