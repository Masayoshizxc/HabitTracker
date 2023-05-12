//
//  MainCoordinator.swift
//  Weather
//
//  Created by Adilet on 25/4/23.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start() {
        let vc = AuthViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }

    func goTabBar() {
        let child = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func register(){
        let vc = RegisterViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}


