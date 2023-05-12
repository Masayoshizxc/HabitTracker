//
//  TabBar.swift
//  HabitsTracker
//
//  Created by Adilet on 11/5/23.
//

import UIKit
import SnapKit

enum TabbarItems: CaseIterable {
    case first
    case second
    case third
    
    
    var tabbarItem: UITabBarItem {
        switch self {
        case .first:
            return .init(
                title: "Статистика",
                image: .init(named: "statsIcon"),
                tag: 1
            )
        case .second:
            return .init(
                title: "Главная",
                image: .init(named: "mainIcon"),
                tag: 1
            )
        case .third:
            return .init(
                title: "Профиль",
                image: .init(named: "profileIcon"),
                tag: 1
            )
        
        }
    }
}



class TabBarController: UITabBarController {
    
    weak var coordinator: TabBarCoordinator?
    
    let statsCoordinator = StatsCoordinator(navigationController: UINavigationController())
    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabBar.layer.cornerRadius = tabbarHeight / 2
//        tabBar.backgroundColor = .white
        setupConstraints()
        configureTabs()
        
        UITabBar.appearance().tintColor = UIColor(red: 68/255, green: 99/255, blue: 99/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .black
        
        navigationItem.hidesBackButton = true
//        navigationController?.navigationBar.backgroundColor = .white
//        tabBarController?.tabBar.isTranslucent = false
//        tabBarController?.tabBar.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func configureTabs() {
        statsCoordinator.start()
        homeCoordinator.start()
        profileCoordinator.start()
        viewControllers = [
            statsCoordinator.navigationController,
            homeCoordinator.navigationController,
            profileCoordinator.navigationController
        ]
        selectedIndex = 1
        
    }
    
    private func setupConstraints(){
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.white.cgColor
        
    }
    
}

