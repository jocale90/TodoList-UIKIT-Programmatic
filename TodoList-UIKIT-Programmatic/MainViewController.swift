//
//  MainViewController.swift
//  TodoList-UIKIT-Programmatic
//
//  Created by Jose Pernia on 2025-02-01.
//

import UIKit

class MainViewController: UIViewController {
    
    
    private var todos: [Todo] = [
        Todo(title: "Study TodoList App"),
        Todo(title: "Study Swift development"),
        Todo(title: "Finish UIKit tutorial")
    ]
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // set Datasource and Delegate
         tableView.dataSource = self
         tableView.delegate = self
        
        // turn off the autoresizing mask
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // set auto loyout constraints, top and bottom sizing to safeArea
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.accessoryType = todo.isComplete ? .checkmark : .none
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var todo = todos[indexPath.row]
        todo.isComplete.toggle()
        todos[indexPath.row] = todo
        tableView.reloadRows(at: [indexPath], with: .none)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
