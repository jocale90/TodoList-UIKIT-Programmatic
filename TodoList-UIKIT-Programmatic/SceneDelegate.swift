//
//  SceneDelegate.swift
//  TodoList-UIKIT-Programmatic
//
//  Created by Jose Pernia on 2025-02-01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 1) Create a UIWindow instance with the windowScene.
        let window = UIWindow(windowScene: windowScene)
        
        let todos: [Todo] = [
            Todo(title: "Study TodoList App"),
            Todo(title: "Study Swift development"),
            Todo(title: "Finish UIKit tutorial")
        ]
        
        // 2) Create a simple root ViewController
        let mainViewController = MainViewController()
        let mainDataSource = MainTableDataSource(
            todos: todos
        )
        mainViewController.tableView.dataSource = mainDataSource
        mainViewController.tableView.delegate = mainDataSource

        // rootViewController.view.backgroundColor = .systemBackground
        
        // 3) Assing the rootViewController and make the windows key and visible
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
        
        // 4) Keep a reference to the new created window
        
        self.window = window
        
        
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

