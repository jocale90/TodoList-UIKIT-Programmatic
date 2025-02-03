//
//  MainViewController.swift
//  TodoList-UIKIT-Programmatic
//
//  Created by Jose Pernia on 2025-02-01.
//

import UIKit

class MainViewController: UIViewController {
    
    private(set) var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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
