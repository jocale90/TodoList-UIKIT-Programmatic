//
//  MainTableDataSource.swift
//  TodoList-UIKIT-Programmatic
//
//  Created by Jose Pernia on 2025-02-02.
//

import UIKit

class MainTableDataSource: NSObject, UITableViewDataSource {
    
    private(set) var todos: [Todo]
    
    init(todos: [Todo]) {
        self.todos = todos
    }
    
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

extension MainTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var todo = todos[indexPath.row]
        todo.isComplete.toggle()
        todos[indexPath.row] = todo
        tableView.reloadRows(at: [indexPath], with: .none)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
