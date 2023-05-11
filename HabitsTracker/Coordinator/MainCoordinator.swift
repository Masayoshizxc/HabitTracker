//
//  MainCoordinator.swift
//  Weather
//
//  Created by Adilet on 25/4/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func register(){
        let vc = RegisterViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func home(){
        let vc = HomeViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func profile(){
        let vc = ProfileViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func stats(){
        let vc = StatsViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
}
