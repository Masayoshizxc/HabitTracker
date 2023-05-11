//
//  Coordinator.swift
//  HabitsTracker
//
//  Created by Adilet on 10/5/23.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
