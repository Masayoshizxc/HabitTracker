//
//  ProfileCoordinator.swift
//  HabitsTracker
//
//  Created by Adilet on 12/5/23.
//

import UIKit

class ProfileCoordinator: NSObject, Coordinator, UINavigationControllerDelegate{
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = ProfileViewController()
        vc.coordinator = self
        vc.tabBarItem = TabbarItems.third.tabbarItem
        navigationController.pushViewController(vc, animated: true)
    }
    

    func childDidFinish(_ child:   Coordinator?){
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child{
                childCoordinators.remove(at: index)
                print(childCoordinators)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
        
        if let authViewController = fromViewController as? AuthViewController{
            childDidFinish(authViewController.coordinator)
        }
    }
    
    
}

