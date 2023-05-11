//
//  HomeViewController.swift
//  HabitsTracker
//
//  Created by Adilet on 10/5/23.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController{
    var coordinator: MainCoordinator?
    private lazy var logo: TitleLogo = {
        let l = TitleLogo()
        
        return l
    }()
    private lazy var profileButton: UIButton = {
        let b = UIButton(type: .custom)
        let img = UIImage(named: "profileIcon")
        b.setImage(img, for: .normal)
        b.layer.cornerRadius = 15
        b.imageEdgeInsets = UIEdgeInsets(top: 15,left: 15,bottom: 15,right: 15)
        b.backgroundColor = .white
        b.tintColor = UIColor(red: 68/255, green: 99/255, blue: 99/255, alpha: 1)
        b.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        return b
    }()
    private lazy var statsButton: UIButton = {
        let b = UIButton(type: .custom)
        let img = UIImage(named: "statsIcon")
        b.setImage(img, for: .normal)
        b.layer.cornerRadius = 15
        b.imageEdgeInsets = UIEdgeInsets(top: 15,left: 15,bottom: 15,right: 15)
        b.backgroundColor = .white
        b.tintColor = UIColor(red: 68/255, green: 99/255, blue: 99/255, alpha: 1)
        b.addTarget(self, action: #selector(statsTapped), for: .touchUpInside)
        return b
    }()
    private lazy var homeButton: UIButton = {
        let b = UIButton(type: .custom)
        let img = UIImage(named: "mainIcon")
        b.setImage(img, for: .normal)
        b.layer.cornerRadius = 15
        b.imageEdgeInsets = UIEdgeInsets(top: 15,left: 15,bottom: 15,right: 15)
        b.backgroundColor = .white
        b.tintColor = UIColor(red: 68/255, green: 99/255, blue: 99/255, alpha: 1)
        b.addTarget(self, action: #selector(homeTapped), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
        
        setupSubviews()
        setupConstraints()
        
    }
    
    @objc func profileTapped(){
        coordinator?.profile()
    }
    @objc func statsTapped(){
        coordinator?.stats()
    }
    @objc func homeTapped(){
        coordinator?.home()
    }
    
}

extension HomeViewController{
    func setupSubviews(){
        view.addSubview(profileButton)
        view.addSubview(statsButton)
        view.addSubview(homeButton)
        view.addSubview(logo)
    }
    func setupConstraints(){
        profileButton.snp.makeConstraints{make in
            make.right.bottom.equalToSuperview().inset(35)
            make.height.width.equalTo(60)
        }
        statsButton.snp.makeConstraints{make in
            make.height.width.equalTo(60)
            make.left.bottom.equalToSuperview().inset(35)
            
        }
        homeButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(35)
            make.width.height.equalTo(60)
        }
        logo.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
    }
}
