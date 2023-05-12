//
//  TabBarCoordinator.swift
//  HabitsTracker
//
//  Created by Adilet on 11/5/23.
//


import UIKit

class TabBarCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var tabBarController: UITabBarController
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        //let userDefaults = UserDefaultsService.shared
        let vc = TabBarController()
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func login() {
    //        let child = LoginCoordinator(navigationController: navigationController)
    //        childCoordinators.append(child)
    //        child.parentCoordinator = self
    //        child.start()
            let vc = AuthViewController()
            //vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
        }

        
        func childDidFinish(_ child: Coordinator?) {
            for (index, coordinator) in childCoordinators.enumerated() {
                if coordinator === child {
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
            
            if navigationController.viewControllers.contains(fromViewController) {
                return
            }
            print(fromViewController)
            if let loginViewController = fromViewController as? AuthViewController {
                childDidFinish(loginViewController.coordinator)
            }
        }

}


